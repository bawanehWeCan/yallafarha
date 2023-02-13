import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/ecommerce/nav_bar/categories.dart';
import 'package:yallah_farha/controller/ecommerce/nav_bar/category.dart';
import 'package:yallah_farha/controller/ecommerce/nav_bar/products.dart';
import 'package:yallah_farha/ui/base_drawer.dart';
import 'package:yallah_farha/ui/screens/ecommerce/widgets/nav_bar/category_grid_builder_nav_bar.dart';
import 'package:yallah_farha/ui/screens/ecommerce/widgets/nav_bar/products_grid_builder_nav_bar.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/categories_card.dart';
import 'package:yallah_farha/ui/widgets/custom_loading/categories_loading.dart';
import 'package:yallah_farha/ui/widgets/custom_loading/categories_shimmer_loading.dart';
import 'package:yallah_farha/ui/widgets/view_cart_button.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/images.dart';

class ProductsNavBarScreen extends StatefulWidget {
  const ProductsNavBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsNavBarScreen> createState() => _ProductsNavBarScreenState();
}

class _ProductsNavBarScreenState extends State<ProductsNavBarScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    Get.put(CategoryNavBarController());
    Get.put(ProductsNavBarController());
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= scrollController.position.maxScrollExtent) {
          if (CategoriesNavBarController.find.selection.isEmpty) {
            if (!ProductsNavBarController.find.allLoaded.value) {
              ProductsNavBarController.find.fetchProductsData(ProductsNavBarController.find.limit.value, 'load_more');
            }
          } else {
            if (!CategoriesNavBarController.find.allLoaded.value) {
              CategoriesNavBarController.find.fetchCategoriesData(CategoriesNavBarController.find.limit.value, true);
            }
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const ViewCartButton(),
      drawer: const BaseDrawer(),
      appBar: const BaseAppBar(),
      body: ListView(
        controller: scrollController,
        children: [
          Image.asset(BaseImages.wishList),
          Container(
            color: BaseColors.grey2F2,
            height: 130,
            child: GetBuilder<CategoriesNavBarController>(
              init: CategoriesNavBarController(),
              builder: (controller) {
                if (controller.categories.isEmpty) {
                  return const CategoriesShimmerLoading();
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  scrollDirection: Axis.horizontal,
                  controller: CategoriesNavBarController.find.scrollCtrl,
                  child: Row(
                    children: List.generate(
                      controller.categories.length,
                      (index) {
                        return CategoriesCard(
                          key: controller.itemKeys[index],
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
              if (ProductsNavBarController.find.isLoading.value || CategoryNavBarController.find.isLoading.value) {
                return const ProductsShimmerLoading();
              }
              if (CategoriesNavBarController.find.selection.isEmpty) {
                return const ProductsGridNavBarBuilder(isButtonsShown: false);
              } else {
                return const CategoryGridNavBarBuilder(isButtonsShown: false);
              }
            },
          ),
        ],
      ),
    );
  }
}
