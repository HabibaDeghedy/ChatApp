import 'package:chat_app/chat_list_screen/widgets/sign_in.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'chat_list_screen/chats_screen.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: SignInScreen(),
    );
  }
}

