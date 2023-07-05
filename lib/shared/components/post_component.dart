import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/models/postmodel.dart';
import 'package:social_master/modules/app/edit_post.dart';
import 'package:social_master/modules/app/share_post.dart';
import 'package:social_master/modules/app/visit_profile.dart';
import '../../models/usermodel.dart';
import '../styles/colors.dart';

Widget postBuilder({required PostModel model, context}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
                          builder: (context) => VisitProfile()));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 22,
                      child: ClipOval(
                        child: Image(
                            width: 80,
                            height: 80,
                            image: NetworkImage('${model.userImage}'),
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
                      Text(model.userName,
                          style: TextStyle(
                              fontFamily: 'SignikaNegative',
                              fontSize: 17,
                              color: AppTheme.colors.darkPurple,
                              fontWeight: FontWeight.bold)),
                      Text(model.date,
                          style: TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 13,
                            color: AppTheme.colors.darkPurple,
                          )),
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
              child: Text(model.caption,
                  style: const TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 15,
                  )),
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
                      child: model.image == ''
                          ? (Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                                color: AppTheme.colors.opacityPurple,
                              ),
                              height: 30,
                            ))
                          : Image(
                              image: NetworkImage('${model.image}'),
                              fit: BoxFit.cover,
                            ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      child: BackdropFilter(
                        filter: model.image == ''
                            ? ImageFilter.blur(sigmaY: 0.0, sigmaX: 0.0)
                            : ImageFilter.blur(sigmaX: 2.5, sigmaY: 4),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, right: 14.0, bottom: 2.0, top: 2.0),
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
                                Text("${model.likes}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
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
                                Text("${model.comments}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
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
                                Text("${model.shares}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 5.0,
                                ),
                              ],
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

Widget myPostBuilder({required MyPostModel model, required context}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 22,
                    child: ClipOval(
                      child: Image(
                          width: 80,
                          height: 80,
                          image: NetworkImage('${model.userImage}'),
                          fit: BoxFit.cover),
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.userName,
                          style: TextStyle(
                              fontFamily: 'SignikaNegative',
                              fontSize: 17,
                              color: AppTheme.colors.darkPurple,
                              fontWeight: FontWeight.bold)),
                      Text(model.date,
                          style: TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 13,
                            color: AppTheme.colors.darkPurple,
                          )),
                    ],
                  ),
                  const Spacer(),

                  PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          print('edit');
                        },
                        value: 1,
                        child:  Row(
                          children: [
                            FaIcon(FontAwesomeIcons.pen),
                            SizedBox(
                              width: 8,
                            ),
                            Text('edit post'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          print('delete');
                        },
                        value: 2,
                        child:  Row(
                          children: [
                            FaIcon(FontAwesomeIcons.trash),
                            SizedBox(
                              width: 8,
                            ),
                            Text('delete post'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          print('promotion');
                        },
                        value: 3,
                        child:  Row(
                          children: [
                            FaIcon(FontAwesomeIcons.dollarSign),
                            SizedBox(
                              width: 8,
                            ),
                            Text('post promotion'),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (value) {
                      switch (value) {
                        case 1:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditPost(model)));
                          break;
                        case 2:
                          print('delete');
                          break;
                        case 3:
                          print('promote');
                          break;
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      model.handleSave();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.solidBookmark,
                      color: model.saveColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(model.caption,
                  style: const TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 15,
                  )),
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
                      child: model.image == ''
                          ? (Container(
                              color: AppTheme.colors.purple,
                            ))
                          : Image(
                              image: NetworkImage('${model.image}'),
                              fit: BoxFit.cover,
                            ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      child: BackdropFilter(
                        filter: model.image == ''
                            ? ImageFilter.blur(sigmaY: 0.0, sigmaX: 0.0)
                            : ImageFilter.blur(sigmaX: 2.5, sigmaY: 4),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, right: 14.0, bottom: 2.0, top: 2.0),
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
                                Text("${model.likes}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
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
                                Text("${model.comments}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: const FaIcon(
                                    FontAwesomeIcons.solidPaperPlane,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text("${model.shares}",
                                    style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 5.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget sharedPostBuilder({required SharedPostModel model, context}) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
                        builder: (context) => VisitProfile()));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 22,
                    child: ClipOval(
                      child: Image(
                          width: 80,
                          height: 80,
                          image: NetworkImage('${model.userImage}'),
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
                    Text(model.userName,
                        style: TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 17,
                            color: AppTheme.colors.darkPurple,
                            fontWeight: FontWeight.bold)),
                    Text(model.date,
                        style: TextStyle(
                          fontFamily: 'SignikaNegative',
                          fontSize: 13,
                          color: AppTheme.colors.darkPurple,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(model.caption,
                style: TextStyle(
                  fontFamily: 'SignikaNegative',
                  fontSize: 16,
                  color: AppTheme.colors.darkPurple,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
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
                                builder: (context) => VisitProfile()));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 22,
                            child: ClipOval(
                              child: Image(
                                  width: 80,
                                  height: 80,
                                  image: NetworkImage('${model.post.image}'),
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
                            Text(model.post.userName,
                                style: TextStyle(
                                    fontFamily: 'SignikaNegative',
                                    fontSize: 17,
                                    color: AppTheme.colors.darkPurple,
                                    fontWeight: FontWeight.bold)),
                            Text(model.date,
                                style: TextStyle(
                                  fontFamily: 'SignikaNegative',
                                  fontSize: 13,
                                  color: AppTheme.colors.darkPurple,
                                )),
                          ],
                        ),
                        const Spacer(),
                        //save post
                        GestureDetector(
                          onTap: () {
                            model.post.handleSave();
                            model.doSomething();
                          },
                          child: FaIcon(FontAwesomeIcons.solidBookmark,
                              color: model.post.saveColor, size: 20),
                        ),

                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(model.post.caption,
                        style: const TextStyle(
                          fontFamily: 'SignikaNegative',
                          fontSize: 15,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onDoubleTap: () {
                        model.post.handleLike();
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
                            child: model.post.image == ''
                                ? (Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                      color: AppTheme.colors.opacityPurple,
                                    ),
                                    height: 30,
                                  ))
                                : Image(
                                    image: NetworkImage('${model.post.image}'),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            child: BackdropFilter(
                              filter: model.post.image == ''
                                  ? ImageFilter.blur(sigmaY: 0.0, sigmaX: 0.0)
                                  : ImageFilter.blur(sigmaX: 2.5, sigmaY: 4),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30)),
                                ),
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
                                          model.post.handleLike();
                                          model.doSomething();
                                        },
                                        child: FaIcon(
                                            FontAwesomeIcons.solidHeart,
                                            size: 21,
                                            color: model.post.likeColor),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text("${model.post.likes}",
                                          style: const TextStyle(
                                            fontFamily: 'SignikaNegative',
                                            fontSize: 15,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      GestureDetector(
                                        onTap: () {model.doSomething();},
                                        child: const FaIcon(
                                            FontAwesomeIcons.solidCommentDots,
                                            size: 21,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text("${model.post.comments}",
                                          style: const TextStyle(
                                            fontFamily: 'SignikaNegative',
                                            fontSize: 15,
                                            color: Colors.white,
                                          )),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SharePost(model.post)));},
                                        child: const FaIcon(
                                          FontAwesomeIcons.solidPaperPlane,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text("${model.post.shares}",
                                          style: const TextStyle(
                                            fontFamily: 'SignikaNegative',
                                            fontSize: 15,
                                            color: Colors.white,
                                          )),
                                      const SizedBox(
                                        width: 5.0,
                                      ),
                                    ],
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
          ),
        ],
      ),
    ));
