import 'package:chat_app/message_screen/message_body.dart';
import 'package:flutter/material.dart';
class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Rhys Larsen',
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.videocam),),
          IconButton(onPressed: (){}, icon: Icon(Icons.call),),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout),),
          SizedBox(width: 10,),
        ],
      ),
      body: MessageBody(),
    ) ;
  }
}
