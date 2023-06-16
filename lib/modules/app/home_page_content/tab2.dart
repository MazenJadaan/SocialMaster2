import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
   Tab2(this.scrollController,{Key? key}) : super(key: key);
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Tab2"),),
    );
  }
}
