import 'package:flutter/material.dart';
import 'package:social_master/shared/components/post_component.dart';
import 'package:video_player/video_player.dart';

import '../../../models/postmodel.dart';

class SeePage extends StatefulWidget {
   SeePage({Key? key}) : super(key: key);

  @override
  State<SeePage> createState() => _SeePageState();
}

class _SeePageState extends State<SeePage> {
 late VideoPlayerController v;
  PostModel testModel =  PostModel(
  isSaved: false,
  isLiked: false,
  likes: 400,
  comments: 12,
  shares: 3,
  caption: 'caption',
  date: '30/12/2019',
  userName: 'Habibi wallah',
  vid:
  'assets/videos/vid.mp4',
  userImage:
  'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    v=VideoPlayerController.asset('assets/videos/vid.mp4')
    ..addListener(() =>setState(() {}))
    ..setLooping(true)
    ..initialize().then((value) => v.play());
  }
  bool isMuted=false;
  @override
  Widget build(BuildContext context) {
    isMuted = v.value.volume==0;
    return  Scaffold(
      body: Center(
        child: Container(child: buildVideo(),),
        ),
    );
  }
  Widget buildVideo () => buildVideoPlayer();
  Widget buildVideoPlayer() =>GestureDetector(
    onTap: (){v.setVolume(isMuted ? 1:0) ;},
    child: AspectRatio(
        aspectRatio: v.value.aspectRatio,
        child: VideoPlayer(v)),
  );
}

