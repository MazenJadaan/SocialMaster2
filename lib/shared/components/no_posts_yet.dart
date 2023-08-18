import 'package:flutter/material.dart';

import '../styles/colors.dart';

Widget noPostsYet() => Center(
  child:   Padding(

        padding: const EdgeInsets.only(

          top: 30.0,

        ),

        child: Container(
          height: 160,
          child: Column(

            children: [

              Icon(

                Icons.camera_alt_outlined,

                size: 100,

                color: AppTheme.colors.darkPurple,

              ),

              Text(

                'No Posts Yet',

                style: TextStyle(

                  fontSize: 30,

                  color: AppTheme.colors.darkPurple,

                ),

              ),

            ],

          ),
        ),

      ),
);
