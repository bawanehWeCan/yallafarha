import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/occassions/add_new_occasion.dart';
import 'package:yallah_farha/controller/occasions/occasion_categories.dart';
import 'package:yallah_farha/ui/base_drawer.dart';
import 'package:yallah_farha/ui/screens/occasions/create_occasion.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

enum Menu { list, grid }

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({Key? key}) : super(key: key);

  @override
  State<OccasionsScreen> createState() => _OccasionsScreenState();
}

class _OccasionsScreenState extends State<OccasionsScreen> {
  late ScrollController scrollController;

  Widget _gridItem({required String image, required String title, required int categoryId}) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CreateOccasionScreen(categoryId: categoryId, occasionImage: image),
          binding: AddNewOccasionBinding(),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomNetworkImage(
            url: image,
            border: 20,
          ),
          Center(
            child: Text(
              title,
              style: BaseTextStyle.white20Bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItem({required String image, required String title, required int categoryId}) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CreateOccasionScreen(categoryId: categoryId, occasionImage: image),
          binding: AddNewOccasionBinding(),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomNetworkImage(
            url: image,
            height: 200,
            width: double.infinity,
            border: 20,
          ),
          Center(
            child: Text(
              title,
              style: BaseTextStyle.white20Bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset == scrollController.position.maxScrollExtent) {
          if (!OccasionCategoriesController.find.allLoaded.value) {
            // OccasionCategoriesController.find.fetchCategoriesData(OccasionCategoriesController.find.limit.value, "load_more");
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: const BaseDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(BaseImages.selectOccasions),
          const SizedBox(height: 10),
          PopupMenuButton<Menu>(
            icon: const Icon(Icons.tune),
            onSelected: (Menu item) {
              if (item == Menu.list) {
                if (OccasionCategoriesController.find.isGrid.value) {
                  OccasionCategoriesController.find.toggleView();
                }
              } else {
                if (!OccasionCategoriesController.find.isGrid.value) {
                  OccasionCategoriesController.find.toggleView();
                }
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.list,
                child: Icon(Icons.list),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.grid,
                child: Icon(Icons.grid_view),
              ),
            ],
          ),
          Expanded(
            child: GetBuilder<OccasionCategoriesController>(
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    if (controller.isGrid.value)
                      GridView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                        itemCount: controller.occasionCategories.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return _gridItem(
                            title: controller.occasionCategories[index].name,
                            image: "${ApiUrl.mainUrl}/${controller.occasionCategories[index].image}",
                            categoryId: controller.occasionCategories[index].id,
                          );
                        },
                      )
                    else
                      ListView.separated(
                        controller: scrollController,
                        separatorBuilder: (context, index) => const SizedBox(height: 20),
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                        itemCount: controller.occasionCategories.length,
                        itemBuilder: (context, index) {
                          return _listItem(
                            title: controller.occasionCategories[index].name,
                            image: "${ApiUrl.mainUrl}/${controller.occasionCategories[index].image}",
                            categoryId: controller.occasionCategories[index].id,
                          );
                        },
                      ),
                    if (controller.loadMore.value)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
