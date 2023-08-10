import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_master/shared/components/components.dart';
import '../../../models/provider/post/postmodel.dart';
import '../../../shared/styles/colors.dart';
import '../handle_media/show_video.dart';

class EditPost extends StatefulWidget {
  EditPost(this.post, {Key? key}) : super(key: key);

  MyPostModel post;

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late final TextEditingController _captionController =
      TextEditingController(text: widget.post.caption);

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
    // selectedVideo = null;
    setState(() {});
  }

  void selectVideo() async {
    XFile? video = await picker.pickVideo(source: ImageSource.gallery);
    if (video == null) return;
    selectedVideo = File(video.path);
    selectedImages = [];
    setState(() {});
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
              child: Text('-Write a new Caption:',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 16,
                    color: AppTheme.colors.darkPurple,
                  )),
            ),
            captionTextFormField(
                controller: _captionController, label: 'Caption', maxlines: 3),
            widget.post.images!.isEmpty
                ? widget.post.video == null
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('-Change the video:',
                                style: TextStyle(
                                  fontFamily: 'SignikaNegative',
                                  fontSize: 16,
                                  color: AppTheme.colors.darkPurple,
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showVideo(
                                      context: context,
                                      vidUrl: widget.post.video!);
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
                              )),
                          Center(
                            child: Icon(
                              Icons.arrow_downward_sharp,
                              size: 40,
                              color: AppTheme.colors.purple,
                            ),
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
                        ],
                      )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('-Change the photo:',
                            style: TextStyle(
                              fontFamily: 'SignikaNegative',
                              fontSize: 16,
                              color: AppTheme.colors.darkPurple,
                            )),
                      ),
                      Container(
                        height: 200,
                        color: AppTheme.colors.opacityPurple,
                        child: MasonryGridView.builder(
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          padding: const EdgeInsets.all(5),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: widget.post.images!.length == 1
                                ? 1
                                : widget.post.images!.length < 10
                                    ? 2
                                    : 3,
                          ),
                          itemCount: widget.post.images!.length,
                          itemBuilder: (context, index) => Image(
                            image: NetworkImage(widget.post.images![index]),
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
                      Center(
                        child: Icon(
                          Icons.arrow_downward_sharp,
                          size: 40,
                          color: AppTheme.colors.purple,
                        ),
                      ),
                      GestureDetector(
                        child: selectedImages.isEmpty == false
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                        : selectedImages.length < 10
                                            ? 2
                                            : 3,
                                  ),
                                  itemCount: selectedImages.length,
                                  itemBuilder: (context, index) => Image(
                                    image: FileImage(selectedImages[index]),
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      height: 150,
                                      color: AppTheme.colors.opacityPurple,
                                      child: myCircularProgressIndicator(),
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
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
                                              size: 140,
                                              color:
                                                  AppTheme.colors.opacityPurple,
                                            ),
                                            Text(
                                                'press to change the photo from gallery or you can let it empty to delete the previous one ',
                                                style: TextStyle(
                                                  fontFamily: 'SignikaNegative',
                                                  fontSize: 12,
                                                  color: AppTheme
                                                      .colors.darkPurple,
                                                )),
                                          ],
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
                        child: Text('long press on the photo to delete it.',
                            style: TextStyle(
                              fontFamily: 'SignikaNegative',
                              fontSize: 13,
                              color: Colors.grey,
                            )),
                      ),
                    ],
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
