import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_users.dart';
import '../../shared/components/chat.dart';

class ChatPage extends StatefulWidget{
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(text: "Ahmad Hafez", secondaryText: "في لعبة طابة اليوم؟", image: "assets/images/calling.png", time: "Now"),
    ChatUsers(text: "Mohamad alraie", secondaryText: "حبيب القلب", image: "assets/images/profile_image.png", time: "Yesterday"),
    ChatUsers(text: "Aya al babbile", secondaryText: "نزل اللابتوب معي اليوم", image:  "assets/images/profile_image.png", time: "31 Mar"),
    ChatUsers(text: "Mazen Gadan", secondaryText: "اتدلى على الاريكة", image:  "assets/images/profile_image.png", time: "28 Mar"),
    ChatUsers(text: "Alaa raie blha", secondaryText: "جاية بالمسكليتة", image:  "assets/images/profile_image.png", time: "23 Mar"),
    ChatUsers(text: "bassem yakhor", secondaryText: "will update you in evening", image:  "assets/images/profile_image.png", time: "17 Mar"),
    ChatUsers(text: "abo abbas", secondaryText: "Can you please share the file?", image:  "assets/images/profile_image.png", time: "24 Feb"),
    ChatUsers(text: "unknown person", secondaryText: "How are you?", image: "assets/images/profile_image.png" , time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Chats",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.purple,size: 20,),
                          SizedBox(width: 2,),
                          Text("New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ChatUsersList(
                  text: chatUsers[index].text,
                  secondaryText: chatUsers[index].secondaryText,
                  image: chatUsers[index].image,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}