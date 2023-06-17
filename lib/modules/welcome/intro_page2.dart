import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background3.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
             const Row(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stay",
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontSize: 45,
                        color: AppTheme.colors.darkPurple),
                  ),
                  Text(
                    "Up To Date",
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: AppTheme.colors.darkPurple),
                  ),
                  Text(
                    "With what's new.",
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontSize: 45,
                        color: AppTheme.colors.darkPurple),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
                height: 280,
                width: 260,
                child:
                    Image(image: AssetImage('assets/images/social-media.png'))),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0,right: 10.0),
              child: Text(
                "See other people's posts and interact ,share or comment on them,or you can create yours.",
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
