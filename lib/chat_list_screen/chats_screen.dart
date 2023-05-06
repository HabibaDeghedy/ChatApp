import 'package:flutter/material.dart';
import 'widgets/chats_body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
    int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildFloatingActionButton(),
      body: ChatsBody(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text('Chats'),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
    );
  }
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index){
        setState(() {
          selectedIndex = index;
        });
        },
        items: const [
      BottomNavigationBarItem(icon: Icon(Icons.messenger), label: 'Chats'),
      BottomNavigationBarItem(icon: Icon(Icons.people), label: 'People'),
      BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
      BottomNavigationBarItem(icon: CircleAvatar(
        backgroundImage: AssetImage('lib/assets/user2.png'),
        radius: 15,
      ), label: 'Chats'),
    ]);
  }
  FloatingActionButton buildFloatingActionButton(){
    return FloatingActionButton(
      backgroundColor: Colors.orange,
      onPressed: (){},
    child: Icon(Icons.person_add_alt),);
  }
}
