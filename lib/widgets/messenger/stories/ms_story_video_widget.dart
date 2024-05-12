import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MsStoryVideoWidget extends StatefulWidget {
  const MsStoryVideoWidget({Key? key}) : super(key: key);

  @override
  State<MsStoryVideoWidget> createState() => _MsStoryVideoWidgetState();
}

class _MsStoryVideoWidgetState extends State<MsStoryVideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 200,
            color: Colors.black,
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : const Center(child: CircularProgressIndicator()),
          ),
          if (_controller.value.isInitialized)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onHorizontalDragStart: (_) {
                  _controller.pause();
                },
                onHorizontalDragUpdate: (details) {
                  final double videoDurationInSeconds =
                  _controller.value.duration.inSeconds.toDouble();
                  final double maxSliderValue = videoDurationInSeconds;
                  final double minSliderValue = 0.0;
                  final double currentPositionInSeconds =
                  _controller.value.position.inSeconds.toDouble();
                  final double newPositionInSeconds =
                  (currentPositionInSeconds +
                      (details.primaryDelta! / context.size!.width) *
                          videoDurationInSeconds)
                      .clamp(minSliderValue, maxSliderValue);
                  _controller.seekTo(Duration(seconds: newPositionInSeconds.toInt()));
                },
                onHorizontalDragEnd: (_) {
                  _controller.play();
                },
                child: Container(
                  height: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  color: Colors.black.withOpacity(0),
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: Colors.white,
                      bufferedColor: Colors.white.withOpacity(0.5),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
