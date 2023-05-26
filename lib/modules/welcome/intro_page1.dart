import 'package:flutter/material.dart';
import 'package:social_master/shared/styles/colors.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background2.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You're",
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontSize: 60,
                        color: AppTheme.colors.darkPurple),
                  ),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: AppTheme.colors.darkPurple),
                  ),
                  Text(
                    "in",
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontSize: 60,
                        color: AppTheme.colors.darkPurple),
                  ),
                ],
              ),
            ),
            Container(
                height: 220,
                width: 300,
                child: const Image(image: AssetImage('assets/images/full_logo.png'))),
            const SizedBox(height: 50,),
            const Padding(
              padding: EdgeInsets.only(left: 20,right: 10),
              child: Text(
                'Make it easier to communicate with everyone with our "Social Master" app.',
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
