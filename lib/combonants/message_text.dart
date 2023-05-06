import 'package:chat_app/chat_list_screen/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  const MessageText({Key? key, required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          !(message.isSender)? Text('Rhys Larsen',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),)
              :SizedBox(height: 3,),
          Text(message.text,
          style: TextStyle(
            color: message.isSender? Colors.black: Colors.black38,
          ),)
        ],),
    );
  }
}
