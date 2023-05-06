import 'dart:io';
import 'package:chat_app/chat_list_screen/widgets/chat_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({Key? key}) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final messageController = TextEditingController();

  void initState() {
    super.initState();
    messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message..',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  messageController.text.isEmpty
                      ? IconButton(
                          onPressed: () async {
                            XFile? file = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);

                            final message = ChatMessage(
                              messageType: ChatMessageType.image,
                              messagesStatus: MessagesStatus.viewed,
                              isSender: true,
                              imageUrl: file!.path,
                            );
                            final storage = FirebaseStorage.instance;
                            final firestore = FirebaseFirestore.instance;
                            final user = FirebaseAuth.instance.currentUser;

                            final ref = storage.ref().child('images').child
                              (DateTime.now().toIso8601String() + file.name);

                            await ref.putFile(File(file.path));
                          final url = await ref.getDownloadURL();

                          Map <String, dynamic> document={
                              'image' : url,
                              'senderId': user?.uid,
                           'senderName': user?.displayName,
                            'senderImage': user?.photoURL,
                            'type': 1,
                            'time':DateTime.now(),
                            };
                          firestore.collection('messages').add(document);
                          setState(() {
                            messageController.clear();
                          });

                          },
                          icon: Icon(
                            Icons.attach_file_outlined,
                            color: Colors.grey[800],
                          ),
                        )
                      : SizedBox(),
                  messageController.text.isEmpty
                      ? SizedBox(
                          width: 5,
                        )
                      : SizedBox(),
                  messageController.text.isEmpty
                      ? IconButton(
                          onPressed: () async{
                            XFile? file = await ImagePicker()
                                .pickImage(source: ImageSource.camera);

                            final message = ChatMessage(
                              messageType: ChatMessageType.image,
                              messagesStatus: MessagesStatus.viewed,
                              isSender: true,
                              imageUrl: file!.path,
                            );
                            final storage = FirebaseStorage.instance;
                            final firestore = FirebaseFirestore.instance;
                            final user = FirebaseAuth.instance.currentUser;

                            final ref = storage.ref().child('images').child
                              (DateTime.now().toIso8601String() + file.name);

                            await ref.putFile(File(file.path));
                            final url = await ref.getDownloadURL();

                            Map<String, dynamic> document = {
                              'image' : url,
                                   'senderId': user?.uid,
                                'senderName': user?.displayName,
                               'senderImage': user?.photoURL,
                              'type': 1,
                              'time':DateTime.now(),
                            };
                            firestore.collection('messages').add(document);
                            setState(() {
                              messageController.clear();
                            });
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey[800],
                          ),
                        )
                      : SizedBox(),
                  messageController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () async{
                           final user= FirebaseAuth.instance.currentUser;
                           final message = messageController.text;

                           final messageDoc = {
                             'message': message,
                              'senderId': user!.uid,
                              'senderName':user.displayName,
                             'time': DateTime.now(),
                           };
                          final doc = await FirebaseFirestore.instance.collection
                            ('messages').add(messageDoc);


                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.orange,
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
