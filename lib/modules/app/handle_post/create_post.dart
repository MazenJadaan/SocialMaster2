import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/validate/validate.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';
import '../../../shared/styles/colors.dart';
import '../handle_media/show_video.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final TextEditingController _captionController = TextEditingController();

  List<File> selectedImages = [];
  File? selectedVideo;
  final ImagePicker picker = ImagePicker();

  Future selectMultipleImages() async {
    final List<XFile> selectedImage =
    await picker.pickMultiImage(maxHeight: 700, maxWidth: 700);
    if (selectedImage.isEmpty) return;
    for (int i = 0; i < selectedImage.length; i++) {
      selectedImages.add(File(selectedImage[i].path));
    }
    selectedVideo = null;
    setState(() {});
  }

  void selectVideo() async {
    XFile? video = await picker.pickVideo(source: ImageSource.gallery);
    if (video == null) return;
    selectedVideo = File(video.path);
    selectedImages = [];
    setState(() {});
  }


  Future createPost({
    List<File>? images,
    File? video,
    required String body,
    String? token,
  }) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST",
        Uri.parse("${AppSetting.baseUrl}${AppSetting.createPostApi}"));
    //add text fields
    request.fields["post_body"] = body;
    request.headers["Authorization"] = "Bearer $token";

    if (video != null) {
      //create multipart using filepath, string or bytes
      var vid =
      await http.MultipartFile.fromPath("video", video.path);
      //add multipart to request
      request.files.add(vid);
    }

    if (images != null) {
      for (int x = 0; x < images.length; x++) {
        var pic = await http.MultipartFile.fromPath("image[]", images[x].path);
        request.files.add(pic);
      }
    }

    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    final json = jsonDecode(responseString);

    if (response.statusCode == 200) {
      // print('done');
    } else {
      // print('object');
    }
  }


  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
              "Create new post",
              style: TextStyle(),
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    height: 190,
                    width: 190,
                    child: Lottie.asset("assets/images/postadd.json")),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '-Write a Caption:',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 16,
                    color: AppTheme.colors.darkPurple,
                  ),
                ),
              ),
              captionTextFormField(validate: Validate.emptyValidate,
                  controller: _captionController,
                  label: 'Caption',
                  maxlines: 2),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'You have to choose either photos or video in one post',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ),
              GestureDetector(
                child: selectedImages.isEmpty == false
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: AppTheme.colors.opacityPurple,
                    child: MasonryGridView.builder(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      padding: const EdgeInsets.all(5),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: selectedImages.length == 1
                            ? 1
                            : selectedImages.length < 10 ? 2 : 3,
                      ),
                      itemCount: selectedImages.length,
                      itemBuilder: (context, index) =>
                          Image(
                            image: FileImage(selectedImages[index]),
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: 150,
                                  color: AppTheme.colors.opacityPurple,
                                  child: myCircularProgressIndicator(),
                                ),
                          ),
                    ),
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
                                size: 100,
                                color: AppTheme.colors.opacityPurple,
                              ),
                            ))),
                  ),
                ),
                onTap: () {
                  selectMultipleImages();
                  setState(() {});
                },
                onLongPress: () {
                  selectedImages = [];
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('long press to delete the photo .',
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 13,
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: selectedVideo != null
                    ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        showVideoFromFile(
                            context: context, vid: selectedVideo!);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.black,
                          child: const Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                    ))
                    : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5),
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.colors.opacityPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.video_call_outlined,
                                size: 100,
                                color: AppTheme.colors.opacityPurple,
                              ),
                            ))),
                  ),
                ),
                onTap: () {
                  selectVideo();
                  setState(() {});
                },
                onLongPress: () {
                  selectedVideo = null;
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('long press to delete the video .',
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 13,
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: myMaterialButton(
                  width: 240,
                  height: 50,
                  text: "Create",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      createPost(body: _captionController.text,
                          token: Prefs.getToken(),
                          video: selectedVideo,
                          images: selectedImages);
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                          msg: "your new post has been published",
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.black54,
                          timeInSecForIosWeb: 2,
                          fontSize: 16);
                    }
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
    );
  }
}
