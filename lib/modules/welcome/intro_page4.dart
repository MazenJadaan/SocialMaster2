import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background4.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get started and",
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontSize: 45,
                        color: AppTheme.colors.darkPurple),
                  ),
                  Text(
                    "لسا ما قررنا شو بدنا نحط هون",
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: AppTheme.colors.darkPurple),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 280,
                width: 260,
                child:
                const Image(
                    image: AssetImage('assets/images/meeting.png'))),
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(
                "Chat with your friends on the app In addition to the voice or video calling service",
                style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 17,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
