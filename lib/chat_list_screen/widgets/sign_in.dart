import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../chats_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 280,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.email),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  label: const Text("Email or Phone"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.password),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () async {
              final _googleSignIn = GoogleSignIn();
              final googleAccount = await _googleSignIn.signIn();

              final googleCredential  = await googleAccount?.authentication;
              final authCredential = GoogleAuthProvider.credential(
                  idToken: googleCredential?.idToken,
                  accessToken: googleCredential?.accessToken
              );
              final firebaseUser = await FirebaseAuth.instance.signInWithCredential(authCredential);

              print(firebaseUser.user?.email);
              print(firebaseUser.user?.displayName);
              print(firebaseUser.user?.uid);
              print(firebaseUser.user?.emailVerified);
              print(firebaseUser.user?.photoURL);
              print(firebaseUser.user?.phoneNumber);
              print(firebaseUser.user?.isAnonymous);


              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ChatsScreen()));
            },
            color: Colors.red,
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),

            ],
          ),
        ),
      ),
    );
  }
}
