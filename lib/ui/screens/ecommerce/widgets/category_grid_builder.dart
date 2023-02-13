import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/controller/ecommerce/category.dart';
import 'package:yallah_farha/controller/ecommerce/products.dart';
import 'package:yallah_farha/ui/screens/ecommerce/view_product.dart';
import 'package:yallah_farha/ui/widgets/wish_list_card.dart';

class CategoryGridBuilder extends StatelessWidget {
  final bool isButtonsShown;

  const CategoryGridBuilder({
    Key? key,
    required this.isButtonsShown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 135),
              itemCount: controller.category.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final images = controller.category[index].images;
                final price = controller.category[index].price;
                final title = controller.category[index].name;
                final id = controller.category[index].id;
                return Obx(
                  () => WishListCard(
                    productId: id,
                    isButtonsShown: isButtonsShown,
                    isAdded: ProductsController.find.addedProductIds.contains(id!),
                    image: images![0],
                    title: title!,
                    price: price.toString(),
                    onTapAdd: () {
                      ProductsController.find.toggleAddedItem(id);
                    },
                    onTapView: () {
                      Get.to(
                        () => ViewProductScreen(
                          image: images[0],
                          price: price.toString(),
                          title: title,
                          itemCount: images.length,
                          id: id,
                          isShown: isButtonsShown,
                        ),
                        binding: ViewProductsBinding(),
                      );
                    },
                  ),
                );
              },
            ),
            if (controller.loadMore.value)
              const Padding(
                padding: EdgeInsets.only(bottom: 80.0),
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}
