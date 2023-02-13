import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/occassions/add_new_occasion.dart';
import 'package:yallah_farha/controller/base_nav_bar_ctrl.dart';
import 'package:yallah_farha/controller/ecommerce/nav_bar/categories.dart';
import 'package:yallah_farha/controller/home/slider.dart';
import 'package:yallah_farha/controller/home/suppliers.dart';
import 'package:yallah_farha/controller/occasions/occasion_categories.dart';
import 'package:yallah_farha/controller/story/stories.dart';
import 'package:yallah_farha/model/ecommerce/categories_model.dart';
import 'package:yallah_farha/model/home/slider_model.dart';
import 'package:yallah_farha/model/home/suppliers_model.dart';
import 'package:yallah_farha/model/story/stories_model.dart';
import 'package:yallah_farha/ui/base_drawer.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/ui/screens/home/view_all_suppliers.dart';
import 'package:yallah_farha/ui/screens/occasions/create_occasion.dart';
import 'package:yallah_farha/ui/screens/story/display_story_screen.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/categories_card.dart';
import 'package:yallah_farha/ui/widgets/custom_loading/categories_shimmer_loading.dart';
import 'package:yallah_farha/ui/widgets/custom_loading/occasions_loading.dart';
import 'package:yallah_farha/ui/widgets/custom_loading/slider_shimmer_loading.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/ui/widgets/footer_images_widget.dart';
import 'package:yallah_farha/ui/widgets/image_box.dart';
import 'package:yallah_farha/ui/widgets/stories_loading.dart';
import 'package:yallah_farha/ui/widgets/story_circle.dart';
import 'package:yallah_farha/ui/widgets/view_all_widget.dart';
import 'package:yallah_farha/ui/widgets/who_we_are_box.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SliderController.sliderData = SliderController.fetchSliderData();
    SuppliersController.suppliersData = SuppliersController.fetchSuppliersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BaseDrawer(),
      appBar: const BaseAppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 110,
            child: FutureBuilder<StoriesModel?>(
              future: StoriesCtrl.find.cartData,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const StoriesLoading();
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasData) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.story!.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 5),
                        itemBuilder: (context, index) {
                          return StoryCircleWidget(
                            image: snapshot.data!.story![index].image == null ? 'https://static.remove.bg/remove-bg-web/c4b29bf4b97131238fda6316e24c9b3606c18000/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg' :
                            '${ApiUrl.mainUrl}/${snapshot.data!.story![index].image}',
                            onTap: () {
                              Get.to(
                                () => DisplayStoryScreen(initialPage: index),
                              );
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Text(AppConstants.failedMessage);
                    } else {
                      return const Text(AppConstants.failedMessage);
                    }
                }
              },
            ),
          ),
          FutureBuilder<SliderModel?>(
            future: SliderController.sliderData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const SliderShimmerLoading();
                case ConnectionState.done:
                default:
                  if (snapshot.hasData) {
                    return CarouselSlider.builder(
                      itemCount: snapshot.data!.sliders!.data!.length,
                      options: CarouselOptions(
                        height: 250.0,
                        padEnds: false,
                        viewportFraction: 1,
                        autoPlay: true,
                      ),
                      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                        return Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          children: [
                            CustomNetworkImage(
                              url: "${ApiUrl.mainUrl}/img/${snapshot.data!.sliders!.data![index].image!}",
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data!.sliders!.data![index].title!,
                                    style: BaseTextStyle.white20Bold,
                                  ),
                                  Text(
                                    snapshot.data!.sliders!.data![index].description!,
                                    style: BaseTextStyle.white14,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text(AppConstants.failedMessage);
                  } else {
                    return const Text(AppConstants.failedMessage);
                  }
              } //..
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
            child: Text(
              "OCCASIONS".tr,
              style: BaseTextStyle.black20SemiBold,
            ),
          ),
          Container(
            color: BaseColors.grey2F2,
            height: 150,
            child: GetBuilder<OccasionCategoriesController>(
              init: OccasionCategoriesController(),
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const OccasionsShimmerLoading();
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 3) {
                      return GestureDetector(
                        onTap: () {
                          BaseNavBarCtrl.find.navBarController.index = 1;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          decoration: BoxDecoration(
                            color: BaseColors.purple3B3,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Explore more".tr,
                            style: BaseTextStyle.white20Bold,
                          ),
                        ), //..
                      );
                    }
                    return ImageBox(
                      width: 200,
                      image: "${ApiUrl.mainUrl}/${controller.occasionCategories[index].image}",
                      onTap: () {
                        Get.to(
                          () => CreateOccasionScreen(
                            categoryId: controller.occasionCategories[index].id,
                            occasionImage: '${ApiUrl.mainUrl}/${controller.occasionCategories[index].image}',
                          ),
                          binding: AddNewOccasionBinding(),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          ViewAllWidget(
            title: "CATEGORIES".tr,
            onPressed: () {
              BaseNavBarCtrl.find.navBarController.index = 2;
            },
          ),
          GetBuilder<CategoriesNavBarController>(
            builder: (controller) {
              return FutureBuilder<CategoriesModel?>(
                future: controller.categoriesData,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CategoriesShimmerLoading();
                    case ConnectionState.done:
                    default:
                      if (snapshot.hasData) {
                        return GetBuilder<CategoriesNavBarController>(
                          builder: (controller) {
                            return Container(
                              color: BaseColors.grey2F2,
                              height: 130,
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5),
                                itemBuilder: (BuildContext context, int index) {
                                  return CategoriesCard(
                                    title: controller.categories[index].name!,
                                    image: '${ApiUrl.mainUrl}/${controller.categories[index].image!}',
                                    borderColor: BaseColors.greyDDD,
                                    onTap: () {
                                      BaseNavBarCtrl.find.navBarController.index = 2;
                                      controller.toggleSelection(
                                        index,
                                        controller.categories[index].id!,
                                      );
                                      controller.scrollToItem(index);
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return const Text(AppConstants.failedMessage);
                      } else {
                        return const Text(AppConstants.failedMessage);
                      }
                  }
                },
              );
            },
          ),
          FutureBuilder<SuppliersModel?>(
            future: SuppliersController.suppliersData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                default:
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    final length = snapshot.data!.suppliers!.data!.length;
                    return ListBody(
                      children: [
                        ViewAllWidget(
                          title: "OUR SUPPLIERS".tr,
                          onPressed: () {
                            Get.to(
                              () => ViewAllSuppliersScreen(
                                itemCount: length,
                                suppliersModel: data,
                              ),
                            );
                          },
                        ),
                        Container(
                          color: BaseColors.grey2F2,
                          height: 160,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            scrollDirection: Axis.horizontal,
                            controller: SuppliersController.scrollCtrl,
                            itemCount: snapshot.data!.suppliers!.data!.length,
                            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5),
                            itemBuilder: (BuildContext context, int index) {
                              return ImageBox(
                                width: 150,
                                image: "${ApiUrl.mainUrl}/storage/${snapshot.data!.suppliers!.data![index].logo}",
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text(AppConstants.failedMessage);
                  } else {
                    return const Text(AppConstants.failedMessage);
                  }
              }
            },
          ),
          const WhoWeAreBox(),
          const FooterImagesWidget(),
        ],
      ),
    );
  }
}
