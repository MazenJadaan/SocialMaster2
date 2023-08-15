import 'package:flutter/material.dart';
import 'package:social_master/models/provider/post/postmodel.dart';

import '../../../shared/components/see_component.dart';





class SeePage extends StatefulWidget {
   SeePage({Key? key}) : super(key: key);

  @override
  State<SeePage> createState() => _SeePageState();
}

class _SeePageState extends State<SeePage> {
  final PageController _pageController = PageController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // vidController =Video
  }

List<SeePost> sees=[
  SeePost( PostModel(
      isSaved: false,
      isLiked: false,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userFName: 'Habibi',
      userLName: 'wallah',
      images: [
        'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
      ],
      video: null,
      userImage:
      'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),),
  SeePost( PostModel(
      isSaved: false,
      isLiked: false,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userFName: 'Habibi',
      userLName: 'wallah',
      images: [
        'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
      ],
      video: null,
      userImage:
      'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),),
  SeePost( PostModel(
      isSaved: false,
      isLiked: false,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userFName: 'Habibi',
      userLName: 'wallah',
      images: [
        'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
      ],
      video: null,
      userImage:
      'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),),
  SeePost( PostModel(
      isSaved: false,
      isLiked: false,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userFName: 'Habibi',
      userLName: 'wallah',
      images: [
        'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
      ],
      video: null,
      userImage:
      'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),),
  SeePost( PostModel(
      isSaved: false,
      isLiked: false,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userFName: 'Habibi',
      userLName: 'wallah',
      images: [
        'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
      ],
      video: null,
      userImage:
      'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),),
  SeePost( PostModel(
      isSaved: false,
      isLiked: false,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userFName: 'Habibi',
      userLName: 'wallah',
      images: [
        'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
        'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
      ],
      video: null,
      userImage:
      'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),),

];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  PageView(
        scrollDirection: Axis.vertical,

        onPageChanged: (index) {
          setState(() {});
        },
        controller: _pageController,
        children: sees,
      ),
    );
  }
}

