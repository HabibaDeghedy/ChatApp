import 'package:chat_app/chat_list_screen/widgets/chat_message.dart';
import 'package:chat_app/combonants/chat_input_field.dart';
import 'package:chat_app/combonants/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class MessageBody extends StatefulWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Expanded(child: Padding(
            padding: EdgeInsets.all(18.0),
            child: StreamBuilder<QuerySnapshot<Map>>(
              stream: FirebaseFirestore.instance.collection('messages')
              .orderBy('time', descending: false)
              .snapshots(),
              builder: (context, snapshot){
                if(snapshot.connectionState== ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(snapshot.data!.size <=0){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final snapShotData= snapshot.data;
                final snapShotDataSize= snapShotData!.size;

                List<ChatMessage> chatMessages =[];

               final user = FirebaseAuth.instance.currentUser!;
               if(user == null ){
                 print('not authenticated');
                 Navigator.of(context).pop();
               }
               snapShotData.docs.forEach((element) {
                 final data = element.data();
                 ChatMessageType type;
                 ChatMessage message;
                 final senderId= data['senderId'];
                 if(data['type'] == 1){
                   type= ChatMessageType.image;
                   message= ChatMessage(
                       messageType: type,
                       messagesStatus: MessagesStatus.viewed,
                       isSender: user.uid == senderId,
                     senderImage: data['senderImage'],
                     senderName: data['senderName'],
                     imageUrl: data['image'],
                   );
                 } else{
                   type= ChatMessageType.text;
                   message= ChatMessage(
                     messageType: type,
                     messagesStatus: MessagesStatus.viewed,
                     isSender: user.uid == senderId,
                     senderImage: data['senderImage'],
                     senderName: data['senderName'],
                     text: data['message'],
                   );
                 }
                 chatMessages.add(message);
               });
               return ListView.builder(
                 itemCount: chatMessages.length,
                 itemBuilder: (context,index)=>Message(
                   message: chatMessages[index],
                   index: index,
               ),);
              },
            ),
          ),),
          ChatInputField(),
        ],
      ),
    );
  }
}
