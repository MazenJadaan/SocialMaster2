import 'package:flutter/material.dart';
import 'package:social_master/models/provider/post/postmodel.dart';
import 'package:social_master/shared/network/constant/constant.dart';
import 'package:video_player/video_player.dart';

import '../../modules/app/visit_profile.dart';
import '../styles/colors.dart';
import 'components.dart';

class SeePost extends StatefulWidget {
  SeePost(this.postModel, {Key? key}) : super(key: key);
  final PostModel? postModel;

  @override
  State<SeePost> createState() => _SeePostState();
}

class _SeePostState extends State<SeePost> {
  late VideoPlayerController _videoPlayerController;

  // late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        // Uri.parse('${AppSetting.baseUrl}${widget.postModel!.video!}')
        'assets/videos/11.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _videoPlayerController.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoPlayerController.value.isInitialized
          ? Stack(
              fit: StackFit.loose,
              children: [
                VideoPlayer(_videoPlayerController),
                Positioned(
                    bottom: 80,
                    left: 20,
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            widget.postModel!.isLiked!
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: widget.postModel!.likeColor,
                            size: 30,
                          ),
                          onPressed: () {
                            widget.postModel!.handleLike();
                          },
                        ),
                        Text(
                          "${widget.postModel!.likes}",
                          style: const TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chat_outlined,
                              color: Colors.white,
                              size: 28,
                            )),
                        Text(
                          "${widget.postModel!.comments}",
                          style: const TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 65,
                    right: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${widget.postModel!.userFName} ${widget.postModel!.userLName}',
                                style: const TextStyle(
                                    fontFamily: 'SignikaNegative',
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              widget.postModel!.date!,
                              style: const TextStyle(
                                fontFamily: 'SignikaNegative',
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VisitProfile(
                                    widget.postModel!.userProfileId)));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child: ClipOval(
                              child: Image(
                                  width: 200,
                                  height: 200,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        color: AppTheme.colors.opacityPurple,
                                        child: myCircularProgressIndicator(),
                                      ),
                                  image: NetworkImage(
                                      '${widget.postModel!.userImage}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            )
          : myCircularProgressIndicator(),
    );
  }
}
