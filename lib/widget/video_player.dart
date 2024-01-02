import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final double? aspectRatio;
  final String? thumbnailUrl;

  VideoPlayerWidget({
    required this.videoUrl,
    this.aspectRatio,
    this.thumbnailUrl,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late ChewieController _chewieController;
  bool _showThumbnail = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer() {
    final videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
    );

    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: widget.aspectRatio ?? 16 / 9,
      autoInitialize: true,
      looping: false,
      showControls: true,
      showControlsOnInitialize: true,
      showOptions: false,
      allowFullScreen: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
        backgroundColor: Colors.grey.shade200,
        bufferedColor: Colors.grey.shade200,
      ),
      draggableProgressBar: true,
      allowPlaybackSpeedChanging: true,
      placeholder: Container(
        color: Colors.black,
        child: const Center(
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: _showThumbnail,
          child: Image.network(
            widget.thumbnailUrl.toString(),
            fit: BoxFit.fill,
            width: Get.width,
            height: double.infinity,
          ),
        ),
        Visibility(
          visible: !_showThumbnail,
          child: AspectRatio(
            aspectRatio: _chewieController.videoPlayerController.value.aspectRatio,
            child: Chewie(controller: _chewieController),
          ),
        ),
        Visibility(
          visible: _showThumbnail,
          child: InkWell(
            onTap: () {
              setState(() {
                _showThumbnail = false;
              });
              _chewieController.play();
            },
            child: Container(
              color: Colors.transparent,
              width: Get.width,
              height: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}


