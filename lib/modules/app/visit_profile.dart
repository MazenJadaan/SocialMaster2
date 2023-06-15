import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/components/post_component.dart';
import '../../shared/styles/colors.dart';

class VisitProfile extends StatelessWidget {
  const VisitProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppTheme.colors.opacityPurple,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 220,
                          child: const Image(
                            image: NetworkImage(
                                'https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Color(0xffdfdbe9),
                      ),
                    ),

                      CircleAvatar(
                        radius: 59,
                        backgroundColor: AppTheme.colors.purple,
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 55,
                          child: ClipOval(
                            child: Hero(
                              tag: 'profile_1',
                              child: Image(
                                  width: 200,
                                  height: 200,
                                  image: NetworkImage(
                                      'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),

                    ),

                    //following and followers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('23440',
                                style: TextStyle(
                                    fontFamily: 'SignikaNegative',
                                    fontSize: 15,
                                    color: AppTheme.colors.darkPurple,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('followers',
                                style: TextStyle(
                                    fontFamily: 'SignikaNegative',
                                    fontSize: 15,
                                    color: AppTheme.colors.darkPurple,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(
                          width: 170,
                        ),
                        Column(
                          children: [
                            Text('570',
                                style: TextStyle(
                                    fontFamily: 'SignikaNegative',
                                    fontSize: 15,
                                    color: AppTheme.colors.darkPurple,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('following',
                                style: TextStyle(
                                    fontFamily: 'SignikaNegative',
                                    fontSize: 15,
                                    color: AppTheme.colors.darkPurple,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                        left: 10,
                        top: 40,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Mohamad Alraie',
                  style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 20,
                      color: AppTheme.colors.darkPurple,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                    'hey welcome to Los Pollos Hermanos  my name is gustavo fring but you can call me gus you can say that i see things in people',
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyMaterialButton(
                      text: 'Follow', onPressed: () {}, fontSize: 18),
                  const SizedBox(
                    width: 20,
                  ),
                  MyMaterialButton(
                      text: 'Message', onPressed: () {}, fontSize: 18),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: AppTheme.colors.purple,
                ),
              ),
              Post(
                  comments: 13,
                  likes: 99,
                  shares: 6,
                  userName: 'Mohamad Alraie',
                  caption:
                      "wake up to reality nothing ever goes as planned in this cursed world the more you live the more you realize that the only things that truly exist in this reality are merely pain suffering and futility.",
                  userImage:
                      "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",
                  image:
                      "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg"),
              const SizedBox(
                height: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
