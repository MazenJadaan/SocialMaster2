import 'package:flutter/material.dart';

import 'video_player.dart';


Future showVideo({required BuildContext context, required String vidUrl}) {
  return
    showDialog(
      context: context,
      builder: (context) =>
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: VideoPlayerWidget(vidUrl),
          ),

    );
}