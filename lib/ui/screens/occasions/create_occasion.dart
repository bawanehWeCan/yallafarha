import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yallah_farha/controller/occasions/create_occasion.dart';
import 'package:yallah_farha/ui/surfaces/signin_dialog.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_icon_text_field.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_text_field.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

enum Department { camera, gallery }

class CreateOccasionScreen extends StatefulWidget {
  final int categoryId;
  final String occasionImage;

  const CreateOccasionScreen({
    Key? key,
    required this.categoryId,
    required this.occasionImage,
  }) : super(key: key);

  @override
  State<CreateOccasionScreen> createState() => _CreateOccasionScreenState();
}

class _CreateOccasionScreenState extends State<CreateOccasionScreen> {
  late TextEditingController startDateCtrl, endDateCtrl, titleCtrl, descriptionCtrl, imageCtrl;
  late DateTime pickedDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showDialog77() {
    if (startDateCtrl.text.isEmpty) {
      setState(() {
        String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
        pickedDate = DateTime.now();
        startDateCtrl.text = formattedDate;
      });
    }
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
minimumDate: DateTime.now().subtract(Duration(hours: 1)),          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              if(endDateCtrl.text.isNotEmpty){
                endDateCtrl.clear();
              }
              String formattedDate = DateFormat('dd-MM-yyyy').format(newDate);
              startDateCtrl.text = formattedDate;
              pickedDate = newDate;
            });
          },
        ),
      ),
    );
  }

  void _showDialog88() {
    if (startDateCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "You must determine a starting date first".tr,
          ),
        ),
      );
      return;
    }
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: CupertinoDatePicker(
          initialDateTime: pickedDate.add(Duration(days: 1)),
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          minimumDate: pickedDate.add(Duration(hours: 1)),
          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              String formattedDate = DateFormat('dd-MM-yyyy').format(newDate);
              endDateCtrl.text = formattedDate;
            });
          },
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog<Department>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select'.tr),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Get.back();
                CreateOccasionController.find.pickImage(ImageSource.gallery).then((value) {
                  if (CreateOccasionController.find.image.value!.path.isEmpty) return;
                  imageCtrl.text = CreateOccasionController.find.image.value!.path;
                });
              },
              child: Text('Gallery'.tr),
            ),
            SimpleDialogOption(
              onPressed: () {
                Get.back();
                CreateOccasionController.find.pickImage(ImageSource.camera).then((value) {
                  if (CreateOccasionController.find.image.value!.path.isEmpty) return;
                  imageCtrl.text = CreateOccasionController.find.image.value!.path;
                });
              },
              child: Text('Camera'.tr),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showStartDatePicker(BuildContext context) async {
    try {
      DateTime? startDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 100)),
        locale: Locale(MySharedPreferences.language),
      );
      if (startDate == null) return;
      pickedDate = startDate;
      String formattedDate = DateFormat('dd-MM-yyyy').format(startDate);
      startDateCtrl.text = formattedDate;
    } catch (onError) {
      Fluttertoast.showToast(msg: "$onError");
    }
  }

  Future<void> _showEndDatePicker(BuildContext context) async {
    if (startDateCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "You must determine a starting date first".tr,
          ),
        ),
      );
      return;
    }
    DateTime? endDate = await showDatePicker(
      context: context,
      locale: Locale(MySharedPreferences.language),
      initialDate: pickedDate,
      firstDate: pickedDate,
      lastDate: DateTime.now().add(const Duration(days: 100)),
    ).catchError((onError) {
      Fluttertoast.showToast(msg: "$onError");
    });

    if (endDate == null) return;

    String formattedDate = DateFormat('dd-MM-yyyy').format(endDate);
    endDateCtrl.text = formattedDate;
  }

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController();
    startDateCtrl = TextEditingController();
    endDateCtrl = TextEditingController();
    imageCtrl = TextEditingController();
    descriptionCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleCtrl.dispose();
    startDateCtrl.dispose();
    endDateCtrl.dispose();
    imageCtrl.dispose();
    descriptionCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Column(
        children: [
          CustomNetworkImage(
            url: widget.occasionImage,
            height: 220,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                children: [
                  const SizedBox(height: 20),
                  CustomIconTextField(
                    controller: titleCtrl,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    label: "Occasion title".tr,
                    icon: FontAwesomeIcons.user,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return BaseStrings.requiredField;
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomIconTextField(
                            textStyle: const TextStyle(fontSize: 12),
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            controller: startDateCtrl,
                            label: "Start date".tr,
                            icon: FontAwesomeIcons.calendarDays,
                            readOnly: true,
                            onTap: () {
                              // _showStartDatePicker(context);
                              _showDialog77();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return BaseStrings.requiredField;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomIconTextField(
                            textStyle: const TextStyle(fontSize: 12),
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            controller: endDateCtrl,
                            label: "End Date".tr,
                            icon: FontAwesomeIcons.calendarDays,
                            readOnly: true,
                            onTap: () {
                              // _showEndDatePicker(context);
                              _showDialog88();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return BaseStrings.requiredField;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<CreateOccasionController>(
                    builder: (controller) {
                      return CustomIconTextField(
                        textStyle: const TextStyle(color: Colors.transparent),
                        controller: imageCtrl,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        suffixIcon: Center(
                          widthFactor: 1.3,
                          child: controller.image.value == null
                              ? Text('Chose image'.tr)
                              : Material(
                                  shape: const CircleBorder(),
                                  color: BaseColors.purple09E,
                                  child: const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                        label: "image".tr,
                        icon: FontAwesomeIcons.image,
                        readOnly: true,
                        onTap: () {
                          _showDialog(context);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return BaseStrings.requiredField;
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomTextField(
                      controller: descriptionCtrl,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      maxLines: 5,
                      labelText: "Description".tr,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return BaseStrings.requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomRoundedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (CheckUserSignIn.check(context)) {
                          CreateOccasionController.find.createOccasion(
                            imageFile: File(CreateOccasionController.find.image.value!.path),
                            name: titleCtrl.text,
                            start: startDateCtrl.text,
                            end: endDateCtrl.text,
                            description: descriptionCtrl.text,
                            context: context,
                            categoryId: widget.categoryId,
                            occasionImage: widget.occasionImage,
                          );
                        }
                      }
                    },
                    label: "Make wishlist".tr,
                    heroTag: "2316544",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
