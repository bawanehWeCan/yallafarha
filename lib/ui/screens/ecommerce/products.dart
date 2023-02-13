import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/ecommerce/categories.dart';
import 'package:yallah_farha/controller/ecommerce/category.dart';
import 'package:yallah_farha/controller/ecommerce/products.dart';
import 'package:yallah_farha/controller/occasions/add_procucts.dart';
import 'package:yallah_farha/ui/screens/ecommerce/widgets/category_grid_builder.dart';
import 'package:yallah_farha/ui/screens/ecommerce/widgets/products_grid_builder.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/categories_card.dart';
import 'package:yallah_farha/ui/widgets/custom_loading/categories_loading.dart';
import 'package:yallah_farha/ui/widgets/custom_loading/categories_shimmer_loading.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class ProductsScreen extends StatefulWidget {
  final int? occasionId;
  final String? occasionImage;

  const ProductsScreen({
    Key? key,
    this.occasionId,
    required this.occasionImage,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    Get.put(CategoriesController());
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= scrollController.position.maxScrollExtent) {
          if (CategoriesController.find.selection.isEmpty) {
            if (!ProductsController.find.allLoaded.value) {
              ProductsController.find.fetchProductsData(ProductsController.find.limit.value, 'load_more');
            }
          } else {
            if (!CategoriesController.find.allLoaded.value) {
              CategoriesController.find.fetchCategoriesData(CategoriesController.find.limit.value, true);
            }
          }
        }
      });
  }

  // if (index == controller.categories.length - 1 && controller.loadMore.value)
  //   const Padding(
  //     padding: EdgeInsets.only(bottom: 15),
  //     child: CircularProgressIndicator(),
  //   ),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => CustomRoundedButton(
            onPressed: ProductsController.find.addedProductIds.isNotEmpty
                ? () {
                    AddProductsController.fetchAddProducts(
                      id: widget.occasionId!,
                      productsId: ProductsController.find.addedProductIds,
                      context: context,
                    );
                  }
                : null,
            label: "Create".tr,
            status: "full_width",
            heroTag: "38973e",
          ),
        ),
      ),
      appBar: const BaseAppBar(),
      body: ListView(
        controller: scrollController,
        children: [
          CustomNetworkImage(
            url: widget.occasionImage!,
            height: 220,
          ),
          Container(
            color: BaseColors.grey2F2,
            height: 130,
            child: GetBuilder<CategoriesController>(
              builder: (controller) {
                // if (controller.categoriesModel == null) {
                //   return const CategoriesShimmerLoading();
                // }
                if (controller.categories.isEmpty) {
                  return const CategoriesShimmerLoading();
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  scrollDirection: Axis.horizontal,
                  controller: CategoriesController.find.scrollCtrl,
                  child: Row(
                    children: List.generate(
                      controller.categories.length,
                      (index) {
                        return CategoriesCard(
                          // key: controller.itemKeys[index],
                          title: controller.categories[index].name!,
                          image: '${ApiUrl.mainUrl}/${controller.categories[index].image!}',
                          borderColor: controller.selection.contains(index) ? BaseColors.primary : BaseColors.greyDDD,
                          onTap: () {
                            controller.toggleSelection(
                              index,
                              controller.categories[index].id!,
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Obx(
            () {
              if (ProductsController.find.isLoading.value || CategoryController.find.isLoading.value) {
                return const ProductsShimmerLoading();
              }
              if (CategoriesController.find.selection.isEmpty) {
                return const ProductsGridBuilder(isButtonsShown: true);
              } else {
                return const CategoryGridBuilder(isButtonsShown: true);
              }
            },
          ),
        ],
      ),
    );
  }
}
