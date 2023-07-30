import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_master/shared/components/components.dart';
import '../../../models/provider/post/postmodel.dart';
import '../../../shared/styles/colors.dart';

class EditPost extends StatefulWidget {
  EditPost(this.post, {Key? key}) : super(key: key);

  MyPostModel post;

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late final TextEditingController _captionController =
      TextEditingController(text: widget.post.caption);
  late Image p = Image(image: NetworkImage(''
      // widget.post.image!
  ));
  File? image;
  final ImagePicker picker = ImagePicker();

  Future uploadImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;

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
          "Edit your post",
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
              child: Text('-Change the photo:',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 16,
                    color: AppTheme.colors.darkPurple,
                  )),
            ),
            Column(
              children: [
                Container(height: 200,child: p,),
                Icon(Icons.arrow_downward_sharp,size: 40,color: AppTheme.colors.purple,),
                GestureDetector(
                  child: image != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        )
                      :
                          Center(
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
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.add_photo_alternate_outlined,
                                          size: 140,
                                          color: AppTheme.colors.opacityPurple,
                                        ),
                                        Text('press to change the photo from gallery or you can let it empty to delete the previous one ',
                                            style: TextStyle(
                                              fontFamily: 'SignikaNegative',
                                              fontSize: 12,
                                              color: AppTheme.colors.darkPurple,
                                            )),
                                      ],
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
              ],
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
            const SizedBox(
              height: 20,
            ),
            Center(
              child: myMaterialButton(
                width: 240,
                height: 50,
                text: "Edit",
                onPressed: () async {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
