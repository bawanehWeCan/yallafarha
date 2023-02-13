import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yallah_farha/controller/story/stories.dart';
import 'package:yallah_farha/ui/screens/story/image_story.dart';
import 'package:yallah_farha/ui/screens/story/video_story_screen.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class DisplayStoryScreen extends StatefulWidget {
  final int initialPage;
  const DisplayStoryScreen({
    Key? key,
    required this.initialPage,
  }) : super(key: key);

  @override
  State<DisplayStoryScreen> createState() => _DisplayStoryScreenState();
}

class _DisplayStoryScreenState extends State<DisplayStoryScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Stack(
        alignment: const Alignment(0, -0.25),
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  "Our Happiness Stories".tr,
                  style: TextStyle(
                    color: BaseColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GetBuilder<StoriesCtrl>(
                  builder: (controller) {
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: controller.stories.length,
                      itemBuilder: (context, index) {
                        if (controller.stories[index].image == null) {
                          return VideoStoryScreen(
                            videoUrl: controller.stories[index].file!,
                            // videoUrl: '${ApiUrl.mainUrl}/${controller.stories[index].file!}',
                            rate: double.parse(controller.stories[index].point!),
                            review: controller.stories[index].content!,
                            reviewSummery: controller.stories[index].short!,
                            time: DateFormat('yyyy-MM-dd').format(controller.stories[index].createdAt!),
                          );
                        } else {
                          return ImageStoryScreen(
                            imageUrl: controller.stories[index].image!,
                            rate: double.parse(controller.stories[index].point!),
                            review: controller.stories[index].content!,
                            reviewSummery: controller.stories[index].short!,
                            time: DateFormat('yyyy-MM-dd').format(controller.stories[index].createdAt!),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                icon: Icon(
                  Icons.navigate_before,
                  color: BaseColors.primary,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                icon: Icon(
                  Icons.navigate_next,
                  color: BaseColors.primary,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
