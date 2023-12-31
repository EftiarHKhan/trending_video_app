import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {

  final String videoUrl;
  final double? aspectRatio;

  VideoPlayerWidget({
    required this.videoUrl,
    this.aspectRatio,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late ChewieController _chewieController;

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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}