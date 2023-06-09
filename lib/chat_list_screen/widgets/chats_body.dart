import 'package:flutter/material.dart';
import '../../model/chats_model.dart';
import 'chats_card_widget.dart';
import 'fill_outline_button.dart';
import '../../message_screen/message_screen.dart';

class ChatsBody extends StatefulWidget {
  const ChatsBody({Key? key}) : super(key: key);

  @override
  State<ChatsBody> createState() => _ChatsBodyState();
}

class _ChatsBodyState extends State<ChatsBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            color: Colors.tealAccent,
            child: Row(
              children: [
                FillOutlineButton(
                  press: () {},
                  text: 'Recent Messages',
                  isFilled: true,
                ),
                SizedBox(
                  width: 20,
                ),
                FillOutlineButton(
                  press: () {},
                  text: 'Active',
                  isFilled: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatsCard(
                chats: chatsData[index],
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MessageScreen()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
