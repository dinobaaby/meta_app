import 'package:flutter/material.dart';
import 'package:meta_app/widgets/messenger/stories/ms_story_video_header.dart';
import 'package:meta_app/widgets/messenger/stories/ms_story_video_reaction_widget.dart';
import 'package:video_player/video_player.dart';

class MsStoryVideoWidget extends StatefulWidget {
  const MsStoryVideoWidget({Key? key}) : super(key: key);

  @override
  State<MsStoryVideoWidget> createState() => _MsStoryVideoWidgetState();
}

class _MsStoryVideoWidgetState extends State<MsStoryVideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  double? _videoHeight;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _videoHeight = _controller.value.size.height;
        });
      });

    _controller.addListener(() {
      if (_controller.value.isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      }
    });
    _controller.addListener(() {
      if(_controller.value.isCompleted){
        Navigator.of(context).pushNamed("/");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        setState(() {
          _controller.pause();
        });
      },
      onLongPressMoveUpdate: (details) {
        setState(() {
          _controller.pause();
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          _controller.play();
        });
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
                vertical: _videoHeight == null
                    ? 0
                    : (MediaQuery.of(context).size.height - _videoHeight!) *
                    2,
                horizontal: 0),
            color: Colors.black,
            child: _controller.value.isInitialized
                ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
            )
                : const Center(child: CircularProgressIndicator()),
          ),
           Positioned(
              top: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width, // Use the parent's width
                child: const MsStoryVideoHeaderWidget(),
              ),
          ),
          Positioned(
            bottom: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width, // Use the parent's width
              child: const MsStoryVideoReactionWidget(),
            ),
          ),

          if (_controller.value.isInitialized)
            Positioned(
              top: 10,
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
                  final double newPositionInSeconds = (currentPositionInSeconds +
                      (details.primaryDelta! / context.size!.width) *
                          videoDurationInSeconds)
                      .clamp(minSliderValue, maxSliderValue);
                  _controller.seekTo(Duration(seconds: newPositionInSeconds.toInt()));
                },
                onHorizontalDragEnd: (_) {
                  _controller.play();
                },
                child: Container(
                  height: 8,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0),
                  ),
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

