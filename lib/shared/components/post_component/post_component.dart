import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/modules/app/handle_post/share_post.dart';
import 'package:social_master/modules/app/visit_profile.dart';
import '../../../models/provider/post/postmodel.dart';
import '../../../modules/app/handle_media/show_video.dart';
import '../../../modules/app/handle_media/show_photo.dart';

import '../../network/constant/constant.dart';
import '../../styles/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../components.dart';

Widget postBuilder({required PostModel model, context}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.colors.opacityPurple,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 8.0, top: 8.0, bottom: 5.0),
              child: Row(
                children: [
                  //profile image
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VisitProfile(model.userProfileId)));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 22,
                      child: ClipOval(
                        child: Image(
                            width: 80,
                            height: 80,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  color: AppTheme.colors.opacityPurple,
                                  child:myCircularProgressIndicator(),
                                ),
                            image: NetworkImage('${AppSetting.baseUrl}${model.userImage}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${model.userFName} ${model.userLName}',
                          style: TextStyle(
                              fontFamily: 'SignikaNegative',
                              fontSize: 17,
                              color: AppTheme.colors.darkPurple,
                              fontWeight: FontWeight.bold)),
                      Text(
                        model.date!,
                        style: TextStyle(
                          fontFamily: 'SignikaNegative',
                          fontSize: 13,
                          color: AppTheme.colors.darkPurple,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  //save post
                  GestureDetector(
                    onTap: () {
                      model.handleSave();
                    },
                    child: FaIcon(FontAwesomeIcons.solidBookmark,
                        color: model.saveColor, size: 20),
                  ),

                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                model.caption!,
                style:  TextStyle(
                  fontFamily: 'SignikaNegative',
                  fontSize: 15,
                  color: AppTheme.colors.darkPurple
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onDoubleTap: () {
                  model.handleLike();
                },
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: model.images!.isEmpty
                          ? (model.video == null
                              ? Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30)),
                                    color: Colors.transparent,
                                  ),
                                  height: 30,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    showVideo(
                                        context: context,
                                        vidUrl: '${AppSetting.baseUrl}${model.video!}');
                                  },
                                  child: Container(
                                    height: 200,
                                    color: Colors.black,
                                    child:const Icon( Icons.play_circle_outline,color: Colors.white,size: 60,),
                                  ),
                                ))
                          : MasonryGridView.builder(
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              padding: const EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    model.images!.length == 1 ? 1 :model.images!.length<10 ? 2 : 3,
                              ),
                              itemCount: model.images!.length,
                              itemBuilder: (context, index) => ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: GestureDetector(
                                  onTap: () {
                                    showPhoto(
                                        context: context,
                                        image: '${AppSetting.baseUrl}${model.images![index]}');
                                  },
                                  child: Hero(
                                    tag: '${AppSetting.baseUrl}${model.images![index]}',
                                    child: Image(
                                        image: NetworkImage(
                                            '${AppSetting.baseUrl}${model.images![index]}'),
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, error, stackTrace) =>
                                            Container(
                                              height: 150,
                                              color: AppTheme.colors.opacityPurple,
                                              child:myCircularProgressIndicator(),
                                            ),
                                       ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        child: BackdropFilter(
                          filter: model.images!.isEmpty
                              ? ImageFilter.blur(sigmaY: 0.0, sigmaX: 0.0)
                              : ImageFilter.blur(sigmaX: 2.5, sigmaY: 4),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0x2A000000),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(20)),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0,
                                  right: 14.0,
                                  bottom: 2.0,
                                  top: 2.0),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      model.handleLike();
                                    },
                                    child: FaIcon(FontAwesomeIcons.solidHeart,
                                        size: 21, color: model.likeColor),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${model.isLiked == true ? model.likes! + 1 : model.likes}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const FaIcon(
                                        FontAwesomeIcons.solidCommentDots,
                                        size: 21,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${model.comments}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SharePost(model)));
                                    },
                                    child: const FaIcon(
                                      FontAwesomeIcons.solidPaperPlane,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${model.shares}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Comment(controller: _commentController, hint: 'write a comment'),
          ],
        ),
      ),
    );




