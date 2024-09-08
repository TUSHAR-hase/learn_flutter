import 'package:flutter/material.dart';
import 'package:learn_flutter/authocation/authocation.dart';
import 'package:learn_flutter/pages/button.dart';
import 'package:learn_flutter/pages/activity.dart';
import 'package:learn_flutter/pages/responsePage.dart';
import 'package:learn_flutter/pages/signup.dart';
import 'package:learn_flutter/pages/text_input_box.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignupScreenState();}

  class _SignupScreenState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
  super.dispose();
  emailController.dispose();
  passwordController.dispose();
  }


  void loginUser() async {
  setState(() {

  });

  String res = await auth_service().loginuser(email: emailController.text, password: passwordController.text);
  if (res == "success") {
  setState(() {

  });
  //navigate to the home screen
  Navigator.of(context).pushReplacement(
  MaterialPageRoute(
  builder: (context) => const HomePage(),
  ),
  );
  } else {
  setState(() {

  });
  // show error

  }
  }
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Login",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold,),),
                TextFieldInput(icon:Icons.email_rounded
                    , hintText: "Enter The Email",textEditingController: emailController, textInputType: TextInputType.text,)
                ,  TextFieldInput(icon:Icons.password_outlined
                    , hintText: "Enter The Password",textEditingController: passwordController, textInputType: TextInputType.visiblePassword),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Forget Password",style: TextStyle(fontSize: 16,color: Colors.blue,)
                                ),
                  ),
                ),
                button(text: "Log in",ontab:loginUser,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?",style: TextStyle(fontSize: 16),),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                      },
                      child: Text(" Sign Up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 16),),

                    )
                  ],
                )
              ],
            ),
          ),

        ),
      )

    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
class bottomnav extends State<Login>{
  int _selectedItem=0;
  List page=[
    HomePage(),
    ResponsePage(),
    Login(),
    // SignupScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: page[_selectedItem],

      ),
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
                label: "Login"
            )
          ],  currentIndex: _selectedItem,
            onTap: (index){
              setState(() {
                _selectedItem=index;
              });
            }
        ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
