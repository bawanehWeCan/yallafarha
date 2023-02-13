import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:yallah_farha/ui/widgets/review_box.dart';

class VideoStoryScreen extends StatefulWidget {
  final String videoUrl;
  final double rate;
  final String review;
  final String reviewSummery;
  final String time;

  const VideoStoryScreen({
    Key? key,
    required this.videoUrl,
    required this.rate,
    required this.review,
    required this.reviewSummery,
    required this.time,
  }) : super(key: key);

  @override
  VideoStoryScreenState createState() => VideoStoryScreenState();
}

class VideoStoryScreenState extends State<VideoStoryScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  Widget _togglePauseButton() {
    if (_controller.value.isPlaying) {
      return const SizedBox.shrink();
    } else {
      return const Icon(
        Icons.play_arrow,
        size: 65,
        color: Colors.white,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((value) {
      _controller.play();
      _controller.setLooping(true);
    });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              height: Get.height,
              child: GestureDetector(
                onTap: () {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Center(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          );
                        } else {
                          return const SizedBox(
                            height: 250,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                    if (_controller.value.isInitialized) _togglePauseButton(),
                  ],
                ),
              ),
            ),
          ),
          ReviewBox(
            name: "khaled",
            rate: widget.rate,
            review: widget.review,
            time: widget.time,
            reviewSummery: widget.reviewSummery,
          ),
        ],
      ),
    );
  }
}
