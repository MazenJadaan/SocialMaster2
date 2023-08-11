class StoryUserModel {
  String profilUrl;
  String name;
  List<StoryModel> stories;
  StoryUserModel(
      {required this.profilUrl, required this.name, required this.stories});
}

class StoryModel {
  String imageUrl;
  StoryModel({
    required this.imageUrl,
  });
}

final dataUsers = [
  StoryUserModel(
      stories: [
        StoryModel(
            imageUrl:
                "https://cdn.motor1.com/images/mgl/WBwMO/s1/lanzamiento-toyota-land-cruiser-300-2022.webp"),
        StoryModel(
            imageUrl:
                "https://i.pinimg.com/736x/62/a2/10/62a2106589c6679b0c733f5bd447ded2.jpg")
      ],
      profilUrl:
          'https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png',
      name: 'Ahmad Hafez'),
];
