import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_master/models/provider/post/postmodel.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/styles/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/connection/all_shares.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';
import '../pages/profile_page/visit_profile.dart';


class SharesScreen extends StatefulWidget {
  SharesScreen({required this.postId, Key? key}) : super(key: key);
  int postId;

  @override
  State<SharesScreen> createState() => _SharesScreenState();
}

class _SharesScreenState extends State<SharesScreen> {




  List<Data>? data;
  bool loading = true;

  Future showAllShares() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.allShares}${widget.postId}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['data'] != null) {
        data = <Data>[];
        json['data'].forEach((v) {
          data!.add( Data.fromJson(v));

        });
        loading = false;
        setState(() {});
        print(data!.length);
      }
    }
  }


  @override
  void initState() {
    showAllShares();
    super.initState();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    return loading?  myCircularProgressIndicator() :
    Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            SizedBox(width: 5),
            Text('Shares'),
          ],
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(.0),
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {

                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VisitProfile(data![index].id)));},

                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage('${AppSetting.baseUrl}${data![index].user!.userProfile!.profilePhoto}'),
                                  radius: 30),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '${data![index].user!.firstName} ${data![index].user!.lastName}',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text('${data![index].body}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  maxLines: 1),
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.2,height: 4,),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

