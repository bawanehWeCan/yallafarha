import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallah_farha/controller/story/share_review.dart';
import 'package:yallah_farha/model/occasions/occasion_categories_model.dart';
import 'package:yallah_farha/network/occasions/occassion_categories.dart';
import 'package:yallah_farha/ui/widgets/attach_file_button.dart';
import 'package:yallah_farha/ui/widgets/attach_file_text_field.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_text_field.dart';
import 'package:yallah_farha/ui/widgets/rating_bar.dart';
import 'package:yallah_farha/ui/widgets/upload_file_dialog.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:yallah_farha/utils/base/text_style.dart';
import 'package:yallah_farha/utils/constants.dart';

enum Department { camera, gallery }

class ShareReviewScreen extends StatefulWidget {
  const ShareReviewScreen({Key? key}) : super(key: key);

  @override
  State<ShareReviewScreen> createState() => _ShareReviewScreenState();
}

class _ShareReviewScreenState extends State<ShareReviewScreen> {
  static const double _space = 20;
  late TextEditingController reviewSummaryCtrl, occasionCtrl, nameCtrl, emailCtrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<occasionCategories> occasions = [];
  late List<int> numbers;

  void fetchOccasions() async {
    await OccasionCategoriesApi.data(0).then((value) {
      setState(() {
        occasions.addAll(value!.categories!);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchOccasions();
    reviewSummaryCtrl = TextEditingController();
    occasionCtrl = TextEditingController();
    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    reviewSummaryCtrl.dispose();
    occasionCtrl.dispose();
    nameCtrl.dispose();
    emailCtrl.dispose();
  }

  Color _toggleBorderColor() {
    if (ShareReviewController.to.isReviewFieldErrorShown.value) {
      return const Color(0xFFD74545);
    } else {
      return BaseColors.greyDDD;
    }
  }

  Future<void> _showImageDialog(BuildContext context) async {
    await showDialog<Department>(
      context: context,
      builder: (BuildContext context) {
        return UploadFileDialog(
          onGallerySelected: () {
            Get.back();
            ShareReviewController.to.uploadImage(ImageSource.gallery);
          },
          onCameraSelected: () {
            Get.back();
            ShareReviewController.to.uploadImage(ImageSource.camera);
          },
        );
      },
    );
  }

  Future<void> _showVideoDialog(BuildContext context) async {
    await showDialog<Department>(
      context: context,
      builder: (BuildContext context) {
        return UploadFileDialog(
          onGallerySelected: () {
            Get.back();
            ShareReviewController.to.uploadVideo(ImageSource.gallery);
          },
          onCameraSelected: () {
            Get.back();
            ShareReviewController.to.uploadVideo(ImageSource.camera);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My review for Yalla Farha".tr,
                style: BaseTextStyle.black16UltraBold,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                child: RatingBarWidget(
                  onRatingUpdate: (rating) {
                    ShareReviewController.to.rate = rating;
                  },
                ),
              ),
              CustomTextField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: reviewSummaryCtrl,
                labelText: "Review summary".tr,
                hintText: "Example: The App is very nice and the concept is amazing.".tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validator: (value) {
                  if (value!.isEmpty) {
                    return BaseStrings.requiredField;
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: _space),
                child: GetBuilder<ShareReviewController>(builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0.5),
                        child: AttachFileTextField(
                          onChanged: (value) {
                            ShareReviewController.to.reviewText.value = value;
                            ShareReviewController.to.toggleReviewFieldError();
                          },
                          hintText: "Consider: Why you choose Yalla Farha? What do you like in the App? Who do you recommend Yalla Farha?".tr,
                          labelText: "Review*".tr,
                          color: _toggleBorderColor(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide.none,
                            bottom: BorderSide(color: _toggleBorderColor()),
                            left: BorderSide(color: _toggleBorderColor()),
                            right: BorderSide(color: _toggleBorderColor()),
                          ),
                        ),
                        child: FittedBox(
                          child: Row(
                            children: [
                              AttachFileButton(
                                title: "Attach image".tr,
                                color: BaseColors.purple0A1,
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  _showImageDialog(context);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: AttachFileButton(
                                  title: "Attach video".tr,
                                  color: BaseColors.purple0A1,
                                  onTap: () {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    _showVideoDialog(context);
                                  },
                                ),
                              ),
                              Text(
                                "You can upload up to 5 photos".tr,
                                style: const TextStyle(
                                  fontSize: 6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (controller.isReviewFieldErrorShown.value)
                        Text(
                          "    ${BaseStrings.requiredField}    ",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFD74545),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                    ],
                  );
                }),
              ),
              CustomTextField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: nameCtrl,
                labelText: "Name*".tr,
                maxLength: 20,
                hintText: "Example: Ali (Max 20 Characters).".tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                validator: (value) {
                  if (value!.isEmpty) {
                    return BaseStrings.requiredField;
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: _space),
                child: CustomTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textDirection: TextDirection.ltr,
                  controller: emailCtrl,
                  labelText: "Email*".tr,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Example: Ali@abc.com.".tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return BaseStrings.requiredField;
                    }
                    return null;
                  },
                ),
              ),
              ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField<String>(
                  value: null,
                  icon: const SizedBox.shrink(),
                  elevation: 16,
                  onChanged: (String? value) {
                    setState(() {
                      occasionCtrl.text = value!;
                    });
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: occasionDropDownDec,
                  validator: (value) {
                    if (value == null) {
                      return BaseStrings.requiredField;
                    }
                    return null;
                  },
                  items: occasions.map<DropdownMenuItem<String>>((occasionCategories value) {
                    return occasions.isEmpty
                        ? const DropdownMenuItem<String>(
                            value: '',
                            child: Text(''),
                          )
                        : DropdownMenuItem<String>(
                            value: value.name,
                            child: Text(value.name!),
                          );
                  }).toList(),
                ),
              ),
              // CustomTextField(
              //   autoValidateMode: AutovalidateMode.onUserInteraction,
              //   controller: occasionCtrl,
              //   labelText: "Occasion*".tr,
              //   readOnly: true,
              //   onTap: () {
              //     Get.to(() => const PickOccasionForReviewScreen(), binding: PickOccasionForReviewBinding())!.then((value) {
              //       occasionCtrl.text = value[0];
              //       ShareReviewController.to.occasionId = value[1];
              //     });
              //   },
              //   floatingLabelBehavior: FloatingLabelBehavior.always,
              //   hintText: "Occasion name: wedding".tr,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return BaseStrings.requiredField;
              //     }
              //     return null;
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<ShareReviewController>(
                      builder: (controller) {
                        return Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              fillColor: MaterialStateProperty.resolveWith((_) => Colors.transparent),
                              side: OnUserInteractionActiveBorderSide(),
                            ),
                          ),
                          child: Checkbox(
                            checkColor: BaseColors.purple096,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            value: controller.isChecked.value,
                            onChanged: (bool? newValue) {
                              controller.toggleCheckBox();
                            },
                          ),
                        );
                      },
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "I have read the Terms & Conditions and agree to them. To find out more about our privacy policy please refer to the Yalla Farha Privacy Notice Your review may be published on other websites advertising this app.".tr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<ShareReviewController>(
                builder: (controller) {
                  if (controller.isCheckErrorShown.value) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          "You must accept terms and conditions to continue".tr,
                          style: const TextStyle(
                            color: Color(0xFFD74545),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              Center(
                child: CustomRoundedButton(
                  onPressed: () {
                    ShareReviewController.to.toggleCheckBoxError();
                    ShareReviewController.to.toggleReviewFieldError();
                    if (_formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (ShareReviewController.to.images.value == null && ShareReviewController.to.video.value == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "You must upload image or video in review field".tr,
                            ),
                          ),
                        );
                      } else {
                        ShareReviewController.to.fetchApiData(
                          points: ShareReviewController.to.rate,
                          short: reviewSummaryCtrl.text,
                          name: nameCtrl.text,
                          content: ShareReviewController.to.reviewText.value,
                          email: emailCtrl.text,
                          occasionId: ShareReviewController.to.occasionId!,
                          imageFile: File(ShareReviewController.to.images.value == null ? '' : ShareReviewController.to.images.value![0].path),
                          context: context,
                          videoFile: File(ShareReviewController.to.video.value == null ? '' : ShareReviewController.to.video.value!.path),
                        );
                      }
                    }
                  },
                  label: "Post review".tr,
                  heroTag: "9i29eii",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnUserInteractionActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(states) => const BorderSide(color: Colors.black26);
}
