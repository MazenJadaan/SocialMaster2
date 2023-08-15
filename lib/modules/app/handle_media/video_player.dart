
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:video_player/video_player.dart';

import '../../../shared/styles/colors.dart';

class VideoPlayerWidget extends StatefulWidget {
  VideoPlayerWidget(this.url,{Key? key}) : super(key: key);
  final String url;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}


class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

   late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
   late Future<void> _initializeVideoPlayerFuture;





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.url));

    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    setState(()=> _chewieController =ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    ));

  }



    @override
    Widget build(BuildContext context) {

    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Card(color: Colors.transparent,
                child:
                Chewie(controller: _chewieController,))
        );
      }else{
      return myCircularProgressIndicator();
      }
     }
     );
          // :myCircularProgressIndicator();


    }

   @override
   void dispose() {
     // TODO: implement dispose
     _videoPlayerController.dispose();
     _chewieController.dispose();
     super.dispose();
   }
  }





























class VideoPlayerFromFileWidget extends StatefulWidget {
  VideoPlayerFromFileWidget(this.video,{Key? key}) : super(key: key);
  final File video;
  @override
  State<VideoPlayerFromFileWidget> createState() => _VideoPlayerFromFileWidgetState();
}


class _VideoPlayerFromFileWidgetState extends State<VideoPlayerFromFileWidget> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  late Future<void> _initializeVideoPlayerFuture;


  @override
  void initState() {
    // TODO: implement initState

    _videoPlayerController = VideoPlayerController.file(File(widget.video.path));
    _initializeVideoPlayerFuture=_videoPlayerController.initialize().then((value) {
      _videoPlayerController.play();
      _videoPlayerController.setLooping(true);

      _chewieController=ChewieController(videoPlayerController: _videoPlayerController);
      setState(() {});
    });

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

    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context,snapshot){
          if (snapshot.connectionState ==ConnectionState.done){
            return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child:Card(color: Colors.transparent,
                    child: Chewie(controller: _chewieController,))
              // VideoPlayer(_videoPlayerController)
            );
          }else{
            return Center(child: CircularProgressIndicator( color: AppTheme.colors.purple,
              backgroundColor:
              AppTheme.colors.opacityPurple,
              strokeWidth: 2,),);
          }
        }
    );
  }
}