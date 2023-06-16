import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReactPost extends ChangeNotifier {
  FaIcon saveIcon = const FaIcon(FontAwesomeIcons.solidBookmark,
      color: Colors.white, size: 19);

  FaIcon likeIcon =
      const FaIcon(FontAwesomeIcons.solidHeart, size: 19, color: Colors.white);
  int isLiked = 0;
}
