import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:social_master/models/story/data.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../../../../shared/network/constant/constant.dart';
import '../../../../shared/shared_preferences.dart';
import '../../visit_profile.dart';
import 'Api_service.dart';
import 'user_model.dart';

class SearchUser extends SearchDelegate {
  FetchUserList _userList = FetchUserList();


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            Navigator.of(context).pop();

          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Data>>(
        future: _userList.getuserList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Data>? data = snapshot.data;
          print(data!.length);

          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VisitProfile(data[index].id)));
                  },
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppTheme.colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child:Image(
                              image: NetworkImage(
                                  '${AppSetting.baseUrl}${data[index].profilePhoto}'),
                            ),
                          ),
                        ),

                        SizedBox(width: 20),
                        Text(
                          '${data[index].firstName}',
                          style: TextStyle(color: Colors.black,
                              fontSize: 18, fontWeight: FontWeight.w600),

                        ),
                        SizedBox(width: 4),
                        Text(
                          '${data[index].lastName}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search User'),
    );
  }

}
