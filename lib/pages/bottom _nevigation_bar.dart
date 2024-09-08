import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/activity.dart';
import 'package:learn_flutter/pages/responsePage.dart';
import 'package:learn_flutter/pages/signup.dart';

class mypage extends StatefulWidget {
  const mypage({super.key});

  @override
  State<mypage> createState() => _mypageState();
}

class _mypageState extends State<mypage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _MyHomePage extends State<mypage> {
  int _selectedItem=0;
  List page=[
    HomePage(),
    ResponsePage(),
    // Login(),
    SignupScreen()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: page[_selectedItem]),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.save_as),
                label: "Response"
            ),

            // BottomNavigationBarItem(
            //     icon: Icon(Icons.login),
            //     label: "Login"
            // ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "signup"
            )
          ],
          currentIndex: _selectedItem,
          onTap: (index){
            setState(() {
              _selectedItem=index;
            });
          }
      ),
    );

  }
}
