import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_master/shared/components/components.dart';

import '../../../shared/styles/colors.dart';

class CreatePost extends StatefulWidget {
  CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController _captionController = TextEditingController();

  File? image;

  final ImagePicker picker = ImagePicker();

  Future uploadImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      // if (pickedImage != null) {
      final image2 = File(pickedImage.path);
      setState(() {});
      image = image2;
    } on PlatformException catch (e) {
      print('Failed to upload image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Create new post",
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('-Add photo:',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 16,
                    color: AppTheme.colors.darkPurple,
                  )),
            ),
            GestureDetector(
              child: image != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        image!,
                        // height: 165,
                        // width: 165,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.colors.opacityPurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 150,
                                color: AppTheme.colors.opacityPurple,
                              ),
                            ))),
                      ),
                    ),
              onTap: () {
                uploadImage();
                setState(() {});
              },
              onLongPress: () {
                image = null;
                setState(() {});
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('long press on the photo to delete it.',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 13,
                    color: Colors.grey,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: myMaterialButton(
                width: 240,
                height: 50,
                text: "Create",
                onPressed: () async {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
