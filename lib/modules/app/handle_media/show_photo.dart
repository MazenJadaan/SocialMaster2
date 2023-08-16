import 'package:flutter/material.dart';
import 'package:social_master/shared/components/components.dart';


Future showPhoto({required BuildContext context, required String image}) {
  return showDialog(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: SizedBox(
        width: 300,
        child: Hero(
          tag: image,
          child: Image(
              image: NetworkImage(image),
              errorBuilder: (context,
                      error,
                      stackTrace) => myCircularProgressIndicator(),
              loadingBuilder: (context, child, loadingProgress) {
                int? expSize;
                expSize = loadingProgress?.expectedTotalBytes;
                if (expSize != null) {
                  return myCircularProgressIndicator();
                } else {
                  return child;
                }
              }),
        ),
      ),
    ),
  );
}