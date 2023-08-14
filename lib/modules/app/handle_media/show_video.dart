import 'dart:io';

import 'package:flutter/material.dart';

import 'video_player.dart';


Future showVideo({required BuildContext context, required String vidUrl}) async{
  return await showDialog(
      context: context,
      builder: (context) =>
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: VideoPlayerWidget(vidUrl),
          ),

    );
}

Future showVideoFromFile({required BuildContext context, required File vid}) {
  return
    showDialog(
      context: context,
      builder: (context) =>
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: VideoPlayerFromFileWidget(vid),
          ),

    );
}