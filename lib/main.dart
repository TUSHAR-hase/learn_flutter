import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/activity.dart';
import 'package:learn_flutter/pages/responsePage.dart';
import 'package:learn_flutter/pages/loginPage.dart';
import 'package:learn_flutter/pages/signup.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem=0;
  List page=[

    HomePage(),
    ResponsePage(),
   // Login(),
    SignupScreen(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(child: Image.asset("assets/images/45431469.webp"),),
           Column(
             children: [
               Text("Welcome to Ws",style: TextStyle(fontSize:40,fontWeight: FontWeight.bold)),
               Text("your trusted companion for safety and empowerment."),
             ],
           ),

            Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                }, child:Text("Sign Up"),style: ButtonStyle(),),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                }, child:Text("Login"))
              ],
            )
          ],
        ),
      )
    );

  }
}

