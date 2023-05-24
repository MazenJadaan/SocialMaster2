import 'package:flutter/material.dart';
import 'package:social_master/shared/components/components.dart';

import 'login.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(children: [
              Image(
                image: AssetImage("assets/images/e.png"),
                fit: BoxFit.fitHeight,
              ),
              Positioned(
                child: Container(
                  height: 200,
                  width: 250,
                  child: Image(
                    image: AssetImage("assets/images/full_logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                left: 150,
                top: 200,
              ),
              Positioned(
                  top: 50,
                  left: 65,
                  child: Container(
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 65,
                          fontFamily: 'DancingScript'),
                    ),
                  )),
              Positioned(
                  top: 140,
                  left: 120,
                  child: Container(
                    child: Text(
                      'To',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontFamily: 'DancingScript'),
                    ),
                  )),
              Positioned(
                top: 460,
                left: 220,
                child: Container(
                    child: MyMaterialButton(
                        text: 'Login',
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Login();
                          }));
                        })),
              ),
              Positioned(
                top: 540,
                left: 220,
                child: Container(
                  child: MyMaterialButton(text: 'Signin', onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  }),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
