import 'package:flutter/material.dart';
import 'package:social_master/models/connection/share_post.dart';
import 'package:social_master/shared/components/post_component/post_component.dart';
import '../../../models/provider/post/postmodel.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';
import '../../../shared/styles/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SharePost extends StatelessWidget {
  SharePost(this.post, {Key? key}) : super(key: key);
  PostModel post;
  TextEditingController _captionController = TextEditingController();

  Future sharePost({
    required ShareParams params,
  }) async {
    print(post.postId);
    var url =
        Uri.parse("${AppSetting.baseUrl}${AppSetting.sharePostApi}${post.postId}");
    var response =await http.post(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"
    }, body: params.toJson());


    jsonDecode(response.body);
    if (response.statusCode == 200) {
      print('done');
    } else {
      print('d');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Share Post",
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('-Write a Caption:',
                      style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontSize: 16,
                        color: AppTheme.colors.darkPurple,
                      )),
                ],
              ),
            ),
            captionTextFormField(
                controller: _captionController, label: 'Caption', maxlines: 3),
            postBuilder(model: post,context: context),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: myMaterialButton(
                width: 240,
                height: 50,
                text: "Share",
                onPressed: () async {
                  sharePost( params: ShareParams(body: _captionController.text),);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
