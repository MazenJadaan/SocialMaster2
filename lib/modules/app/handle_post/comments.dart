import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_master/models/provider/post/postmodel.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/styles/colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../models/connection/profile/commentsModel.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';
import '../pages/profile_page/visit_profile.dart';


class commentsScreen extends StatefulWidget {
  commentsScreen({required this.postId, Key? key}) : super(key: key);
  int postId;

  @override
  State<commentsScreen> createState() => _commentsScreenState();
}

class _commentsScreenState extends State<commentsScreen> {
  TextEditingController _commentController = TextEditingController();

  Future<CreateComments?> creatComment({
    required commentParams params,
  }) async {
    print(widget.postId);
    var url =
        Uri.parse("${AppSetting.baseUrl}${AppSetting.writeComment}${widget.postId}");
    var response = await http.post(url,
        headers: {"Authorization": "Bearer ${Prefs.getToken()}"},
        body: params.toJson());
    print('fff');
    print(response.body);
    print("asdgdsag");
    var json = jsonDecode(response.body);
  print(response.statusCode);
  print("dsfsdfdsf");
    if (response.statusCode == 200) {
     return CreateComments.fromJson(json);

    } else {
      print('d');
    }
  }


  List<Data>? data;
  bool loading = true;

  Future showAllcomments() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.showAllComments}${widget.postId}");
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

  Future deleteComment({required int commentId})async{
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.deleteComment}$commentId");
    var response = await http.delete(url,headers:  {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "your comment has been deleted",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black54,
          timeInSecForIosWeb: 2,
          fontSize: 16);
    }

  }

  @override
  void initState() {
    showAllcomments();
    super.initState();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    return loading?  myCircularProgressIndicator() :
      Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 5),
            Text('Comments'),
          ],
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
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
                                    Spacer(),
                                    IconButton(onPressed: (){
                                      deleteComment(commentId: data![index].id! );
                                      data!.removeAt(index);
                                      setState(() {

                                      });
                                    }, icon:
                                    Icon(Icons.delete))
                                  ],
                                ),
                              ),
                              subtitle: Text('${data![index].comment}',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  maxLines: 1),
                            ),
                            Divider(
                            color: Colors.grey,
                            thickness: 0.2,height: 4,),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.send, color: AppTheme.colors.purple),
                  onPressed: () {
                    creatComment(
                        params:
                            commentParams(comment: _commentController.text));
                    //     .then((value) {print(value);
                    //           print('hello');
                    //   data?.add(Data(comment: _commentController.text,user: value!.data!.user));
                    //   setState(() {
                    //   });
                    // });

                    _commentController.clear();
                  },
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Enter your comment',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

