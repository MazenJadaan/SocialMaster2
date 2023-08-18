import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_master/models/provider/post/postmodel.dart';
import 'package:video_player/video_player.dart';
import '../../modules/app/handle_post/comments.dart';
import '../../modules/app/pages/profile_page/visit_profile.dart';
import '../network/constant/constant.dart';
import '../styles/colors.dart';
import 'components.dart';

class SeePost extends StatefulWidget {
  SeePost(this.model, {Key? key}) : super(key: key);
  final PostModel? model;

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
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('${AppSetting.baseUrl}${widget.model!.video!}'))
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

  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostModel>.value(
        value: widget.model!,
        child: Consumer<PostModel>(
            builder: (context, postModel, child) => Scaffold(
                  backgroundColor: Colors.black,
                  body: _videoPlayerController.value.isInitialized
                      ? GestureDetector(
                          onTap: () {
                            isPaused = !isPaused;
                            isPaused == false
                                ? _videoPlayerController.play()
                                : _videoPlayerController.pause();
                          },
                          onDoubleTap: () {
                            postModel.handleLike();
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(),
                              Center(
                                child: AspectRatio(
                                    aspectRatio: _videoPlayerController
                                        .value.aspectRatio,
                                    child: VideoPlayer(_videoPlayerController)),
                              ),
                              Positioned(
                                  bottom: 90,
                                  left: 10,
                                  child: Column(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          postModel.isLiked!
                                              ? FontAwesomeIcons.solidHeart
                                              : FontAwesomeIcons.heart,
                                          color: postModel.likeColor,
                                          size: 29,
                                        ),
                                        onPressed: () {
                                          postModel.handleLike();
                                        },
                                      ),
                                      Text(
                                        "${postModel.likes}",
                                        style: const TextStyle(
                                          fontFamily: 'SignikaNegative',
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      IconButton(
                                          onPressed: () {

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                              return commentsScreen(postId:postModel.postId!);
                                            },));
                                          },
                                          icon: const Icon(
                                            FontAwesomeIcons.commentDots,
                                            color: Colors.white,
                                            size: 29,
                                          )),
                                      Text(
                                        "${postModel.comments}",
                                        style: const TextStyle(
                                          fontFamily: 'SignikaNegative',
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          postModel.handleSave();
                                        },
                                        icon: FaIcon(FontAwesomeIcons.bookmark,
                                            color: postModel.saveColor,
                                            size: 29),
                                      ),
                                    ],
                                  )),
                              Positioned(
                                bottom: 65,
                                right: 15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${postModel.userFName} ${postModel.userLName}',
                                                style: const TextStyle(
                                                    fontFamily:
                                                        'SignikaNegative',
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                              postModel.date!,
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
                                            _videoPlayerController.pause();
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        VisitProfile(postModel
                                                            .userProfileId)));
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 30,
                                            child: ClipOval(
                                              child: Image(
                                                  width: 200,
                                                  height: 200,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Container(
                                                        color: AppTheme.colors
                                                            .opacityPurple,
                                                        child:
                                                            myCircularProgressIndicator(),
                                                      ),
                                                  image: NetworkImage(
                                                      '${AppSetting.baseUrl}${postModel.userImage}'),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: 260,
                                      child: Text(
                                        postModel.caption!,
                                        style: const TextStyle(
                                          fontFamily: 'SignikaNegative',
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              isPaused
                                  ? const Center(
                                      child: CircleAvatar(
                                        radius: 32,
                                        backgroundColor: Color(0x50000000),
                                        child: Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.white,
                                          size: 60,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        )
                      : myCircularProgressIndicator(),
                ),),);
  }
}
