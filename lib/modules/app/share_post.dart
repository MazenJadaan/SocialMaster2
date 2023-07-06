import 'package:flutter/material.dart';
import 'package:social_master/models/post/postmodel.dart';
import 'package:social_master/shared/components/post_component.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class SharePost extends StatelessWidget {
  SharePost(this.post,{Key? key}) : super(key: key);
 PostModel post;
  @override
  Widget build(BuildContext context) {
    TextEditingController _captionController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
              "Share Post",
              style: TextStyle(),
            )),
      ),
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('-Write a Caption:',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 16,
                    color: AppTheme.colors.darkPurple,
                  )),
            ),
            captionTextFormField(
                controller: _captionController, label: 'Caption', maxlines: 3),
            postBuilder(model: post),
            const SizedBox(height: 10,),
            Center(
              child: myMaterialButton(
                width: 240,
                height: 50,
                text: "Share",
                onPressed: () async {},
              ),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),

    );
  }
}
