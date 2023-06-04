import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../styles/colors.dart';

Widget ImagePost({
  Function()? saveFunc,
  Function()? likeFunc,
  Function()? commentFunc,
  Function()? shareFunc,
  Function()? profile,
  String? userImage,
  String? image,
  String caption = "",
  String userName = "hahaha",
  int likes = 0,
  int comments = 0,
  int shares = 0,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
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
                  GestureDetector(
                    onTap: profile,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 22,
                      child: ClipOval(
                        child: Image(
                            width: 80,
                            height: 80,
                            image: NetworkImage('$userImage'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(userName,
                      style: TextStyle(
                          fontFamily: 'SignikaNegative',
                          fontSize: 17,
                          color: AppTheme.colors.darkPurple,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  GestureDetector(
                    onTap: saveFunc,
                    child: const FaIcon(
                      FontAwesomeIcons.solidBookmark,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(caption,
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
                      image: NetworkImage('$image'),
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
                                onTap: likeFunc,
                                child: const FaIcon(FontAwesomeIcons.solidHeart,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text("$likes",
                                  style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 16,
                                      color: Colors.white,
                                      )),
                              const SizedBox(
                                width: 18,
                              ),
                              GestureDetector(
                                onTap: commentFunc,
                                child: const FaIcon(
                                    FontAwesomeIcons.solidCommentDots,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text("$comments",
                                  style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 16,
                                      color: Colors.white,
                                      )),
                              const Spacer(),
                              GestureDetector(
                                onTap: shareFunc,
                                child: const FaIcon(
                                  FontAwesomeIcons.share,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text("$shares",
                                  style: const TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 16,
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
