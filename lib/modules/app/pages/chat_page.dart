import 'package:flutter/material.dart';

// class Chat_Page extends StatelessWidget {
//   const Chat_Page({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text("chat"),),
//     );
//   }
// }



class ChatPage extends StatefulWidget {

  static const String screenRoute='Chat_Page';

  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title:  Row(
          children: [
            // Image.asset('images/small_logo.png',height: 25,),
            // const  SizedBox(width: 10,),
            const Text('Chat'),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
              icon:const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
            Container(
              decoration:const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: Colors.purple,
                        width: 2
                    ),
                      bottom:BorderSide( color: Colors.purple,
                          width: 2),
                  )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged:(value) {},
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical:10,
                              horizontal:20
                          ),
                          hintText: 'Write your message here...',
                          border: InputBorder.none),
                    ),
                  ),
                  TextButton(onPressed: (){},
                      child:Text('send',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),) )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

