import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/story/pick_occasion_for_review_ctrl.dart';
import 'package:yallah_farha/ui/base_drawer.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

enum Menu { list, grid }

class PickOccasionForReviewScreen extends StatefulWidget {
  const PickOccasionForReviewScreen({Key? key}) : super(key: key);

  @override
  State<PickOccasionForReviewScreen> createState() => _PickOccasionForReviewScreenState();
}

class _PickOccasionForReviewScreenState extends State<PickOccasionForReviewScreen> {
  late ScrollController scrollController;

  Widget _gridItem({required String image, required String title, required int categoryId}) {
    return GestureDetector(
      onTap: () {
        Get.back(result: [title, categoryId]);
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
        Get.back(result: [title, categoryId]);
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
    PickOccasionForReviewController.find.fetchCategoriesData(1, "default");
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset == scrollController.position.maxScrollExtent) {
          if (!PickOccasionForReviewController.find.allLoaded.value) {
            // PickOccasionForReviewController.find.fetchCategoriesData(PickOccasionForReviewController.find.limit.value, "load_more");
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
                if (PickOccasionForReviewController.find.isGrid.value) {
                  PickOccasionForReviewController.find.toggleView();
                }
              } else {
                if (!PickOccasionForReviewController.find.isGrid.value) {
                  PickOccasionForReviewController.find.toggleView();
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
            child: GetBuilder<PickOccasionForReviewController>(
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
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
                              title: controller.occasionCategories[index].quantity,
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
                              title: controller.occasionCategories[index].quantity,
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
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
