import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer(this.url,{Key? key}) : super(key: key);
  final String url;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}


class _VideoPlayerState extends State<VideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  // GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController = VideoPlayerController.asset(widget.url);
    _chewieController = ChewieController(
      autoInitialize: true,
        videoPlayerController: _videoPlayerController,
        aspectRatio:_videoPlayerController.value.aspectRatio
    );
    super.initState();
  }
    @override
  void dispose() {
    // TODO: implement dispose
      _videoPlayerController.dispose();
      _chewieController.dispose();
      super.dispose();

  }
    @override
    Widget build(BuildContext context) {
      return Container(
        child: AspectRatio(
          aspectRatio: 16/9,
          child:Card(child: Chewie(controller: _chewieController,),
          color: Color(0x50000000),)
        ),
      );
    }
  }

