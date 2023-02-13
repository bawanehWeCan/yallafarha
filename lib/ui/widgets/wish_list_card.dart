import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/my_order_ctrl.dart';
import 'package:yallah_farha/ui/widgets/custom_material_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class WishListCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool isButtonsShown;
  final Function() onTapView;
  final Function() onTapAdd;
  final bool isAdded;
  final int productId;

  const WishListCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    this.isButtonsShown = true,
    required this.onTapView,
    required this.onTapAdd,
    required this.isAdded,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrderCtrl>(
      builder: (controller) {
        int itemQuantity = 0;
        if (!isButtonsShown) {
          var value = controller.orderList.where((element) => element.id == productId);
          for (var element in value) {
            itemQuantity = itemQuantity + element.quantity!;
          }
        }
        return Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BaseBorderRadius.border15,
                // side: const BorderSide(color: Colors.red, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Center(
                        child: GestureDetector(
                          onTap: onTapView,
                          child: ClipRRect(
                            borderRadius: BaseBorderRadius.border20,
                            child: CustomNetworkImage(
                              url: "${ApiUrl.mainUrl}/storage/$image",
                              height: 190,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(title, style: BaseTextStyle.black14Bold),
                    Text("$price JD", style: BaseTextStyle.purple127ACUltraLight),
                    if (isButtonsShown) ...[
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomMaterialRoundedButton(
                              title: 'View'.tr,
                              color: BaseColors.pelorous,
                              onTap: onTapView,
                              isAdded: false,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomMaterialRoundedButton(
                              title: isAdded ? 'Added'.tr : 'Add'.tr,
                              color: BaseColors.purple0A1,
                              onTap: onTapAdd,
                              isAdded: isAdded,
                            ),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ),
            if (itemQuantity != 0 && !isButtonsShown)
              Container(
                key: GlobalKey(),
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: BaseColors.purple6C4,
                  borderRadius: const BorderRadiusDirectional.only(topStart: Radius.circular(15), bottomEnd: Radius.circular(15)),
                ),
                child: Text(
                  "$itemQuantity",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        );
      },
    );
  }
}
