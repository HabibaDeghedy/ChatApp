import 'package:flutter/cupertino.dart';

enum ChatMessageType {  audio, image, video, text }

enum MessagesStatus { not_sent, viewed, not_viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessagesStatus messagesStatus;
  final bool isSender;
  final String? senderName;
  final String? senderImage;
  final String? imageUrl;

  ChatMessage({
   this.text = '',
   required this.messageType,
    required this.messagesStatus,
    required this.isSender,
    this.senderName,
    this.senderImage,
    this.imageUrl,
});
}

class ChatMessages with ChangeNotifier{
  List<ChatMessage>chatMessages =[
    ChatMessage(
      text:'I/m at Bridget/s',
        messageType: ChatMessageType.text ,
        messagesStatus:MessagesStatus.viewed ,
        isSender: true,
    ),
    ChatMessage(
      text:'going there right now',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.viewed ,
      isSender: false,
    ),
    ChatMessage(
      text:'waiting!!',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.viewed ,
      isSender: true,
    ),
    ChatMessage(
      text:'gonna go to the store first',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.viewed ,
      isSender: false,
    ),
    ChatMessage(
      text:'why?',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.viewed ,
      isSender: true,
    ),
    ChatMessage(
      text:'wanna buy some shit for later',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.viewed ,
      isSender: false,
    ),   
    ChatMessage(
      text:'like?',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.viewed ,
      isSender: true,
    ),
    ChatMessage(
      text:'you know sunscreen shit like that',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.viewed ,
      isSender: false,
    ),
    ChatMessage(
      text:'its a pool party, don/t wanna get sun burnt!',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.viewed ,
      isSender: false,
    ),
    ChatMessage(
      text:'Alright cool',
      messageType: ChatMessageType.text ,
      messagesStatus:MessagesStatus.not_viewed ,
      isSender: true,
    ),


  ];

  void addMessage(ChatMessage message){
    chatMessages.add(message);
    notifyListeners();
  }

  List<ChatMessage> get getMessageList => chatMessages;
}
