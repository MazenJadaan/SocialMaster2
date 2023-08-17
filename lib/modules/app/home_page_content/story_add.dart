import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';
import '../../../shared/styles/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StoryAdd extends StatefulWidget {
  const StoryAdd({Key? key}) : super(key: key);

  @override
  State<StoryAdd> createState() => _StoryAddState();
}

class _StoryAddState extends State<StoryAdd> {
  final TextEditingController _captionController = TextEditingController();
  File? image;
  final ImagePicker picker = ImagePicker();
  String? token = Prefs.getToken();

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

  Future createStory(
      {required String text, File? media, required String token}) async {
print(token);

    var request = http.MultipartRequest(
        "POST", Uri.parse("${AppSetting.baseUrl}${AppSetting.createStoryApi}"));
    request.fields["story_body"] = text;
    request.headers["Authorization"] = "Bearer ${token}";

    if (media != null) {
      //create multipart using filepath, string or bytes
      var med = await http.MultipartFile.fromPath("media", media.path);
      //add multipart to request
      request.files.add(med);
    }

    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    jsonDecode(responseString);


    if (response.statusCode == 201) {

      print('done');
    } else {
      print('object');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Create New Story",
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 110,
                width: 110,
                child: Lottie.asset("assets/images/storya.json")),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '-Write a text story:',
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 16,
                      color: AppTheme.colors.darkPurple,
                    ),
                  ),
                ),
              ],
            ),
            captionTextFormField(
                controller: _captionController, label: 'text', maxlines: 2),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Add photo:',
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
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: myMaterialButton(
                        width: 240,
                        height: 50,
                        text: "Share",
                        onPressed: () async {
                          createStory(
                              text: _captionController.text,
                              media: image!,
                              token: token!);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
