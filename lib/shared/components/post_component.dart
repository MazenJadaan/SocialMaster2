import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:social_master/models/postmodel.dart';
import 'package:social_master/modules/app/visit_profile.dart';

import '../styles/colors.dart';


Widget postBuilder({required PostModel model, context}) =>
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
                    onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VisitProfile()));},
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
                      onTap: () {},
                      child: const FaIcon(FontAwesomeIcons.solidBookmark,
                          color: Colors.white, size: 19),

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
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: NetworkImage('${model.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 4),
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
                              bottom: 5.0,
                              top: 4.0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),

                              GestureDetector(
                                onTap: (){},
                                child: const FaIcon(
                                    FontAwesomeIcons.solidHeart,
                                    size: 19,
                                    color: Colors.white),
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
                                onTap: (){},
                                child: const FaIcon(
                                    FontAwesomeIcons.solidCommentDots,
                                    size: 19,
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
                                onTap: (){},
                                child: const FaIcon(
                                  FontAwesomeIcons.solidPaperPlane,
                                  size: 19,
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
            // Comment(controller: _commentController, hint: 'write a comment'),
          ],
        ),
      ),
    );




Widget myPostBuilder({required MyPostModel model,required context}) =>
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
                  GestureDetector(
                    onTap: (){},
                    child: const FaIcon(
                      FontAwesomeIcons.solidBookmark,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),

                  PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) =>  [
                      PopupMenuItem(
                        onTap: (){print('edit');},
                        child: const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.pen),
                            SizedBox(width: 8,),
                            Text('edit post'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: (){print('delete');},
                        child: const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.trash),
                            SizedBox(width: 8,),
                            Text('delete post'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: (){print('promotion');},
                        child: const Row(
                          children: [
                            FaIcon(FontAwesomeIcons.dollarSign),
                            SizedBox(width: 8,),
                            Text('post promotion'),
                          ],
                        ),
                      ),
                    ],
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
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: NetworkImage('${model.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 2),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 14.0, right: 14.0, bottom: 5.0, top: 4.0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: const FaIcon(
                                    FontAwesomeIcons.solidHeart,
                                    size: 19,
                                    color: Colors.white),
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
                                onTap: (){},
                                child: const FaIcon(
                                    FontAwesomeIcons.solidCommentDots,
                                    size: 19,
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
                                onTap: (){},
                                child: const FaIcon(
                                  FontAwesomeIcons.solidPaperPlane,
                                  size: 19,
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
          ],
        ),
      ),
    );