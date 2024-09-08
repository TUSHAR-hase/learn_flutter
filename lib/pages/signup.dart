import 'package:flutter/material.dart';
import 'package:learn_flutter/authocation/authocation.dart';
import 'package:learn_flutter/pages/button.dart';
import 'package:learn_flutter/pages/activity.dart';
import 'package:learn_flutter/pages/loginPage.dart';
import 'package:learn_flutter/pages/responsePage.dart';
import 'package:learn_flutter/pages/sign_up_textInputfield.dart';
import 'package:learn_flutter/pages/text_input_box.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController contectcontroller = TextEditingController();
  final TextEditingController Parentcontectcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    contectcontroller.dispose();
    Parentcontectcontroller.dispose();
    addresscontroller.dispose();
  }

  void signupUser() async {

    if (!mounted) return;
    setState(() {
      isLoading = true;
    });

    String res = await auth_service().signupUser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
    contect: contectcontroller.text,
      Parent_contect: Parentcontectcontroller.text,
      address: addresscontroller.text,

    );
    if (!mounted) return;
    if (res == "success") {
      setState(() {
isLoading=false;
      });
      //navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      setState(() {
isLoading=false;
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        ),
      );
    }
  }
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            // margin: EdgeInsets.symmetric(vertical: 100),
            child: SingleChildScrollView(
              child: Column(

                children: [

                  Text("Sign Up",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold,),),
                  sign_up_textinputfield(hintText: "Enter The Name", textInputType: TextInputType.text,textEditingController: nameController,),
                  sign_up_textinputfield(hintText: "Enter The Email", textInputType: TextInputType.text,textEditingController: emailController,),
                  sign_up_textinputfield(hintText: "Enter The Password", textInputType: TextInputType.visiblePassword,textEditingController: passwordController,),
               sign_up_textinputfield(hintText: "Enter The Parent Contect Number", textInputType: TextInputType.number,textEditingController: Parentcontectcontroller,),
               sign_up_textinputfield(hintText: "Enter The Your Contect Number", textInputType: TextInputType.number,textEditingController: contectcontroller,),
                  sign_up_textinputfield(hintText: "Enter The Address", textInputType: TextInputType.text,textEditingController: addresscontroller,),
                  button(text:"Sign Up", ontab:signupUser)
                  ,  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("A You have Already account?",style: TextStyle(fontSize: 16),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        },
                        child: Text(" Login",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue,fontSize: 16),),

                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
class bottomnav extends State<SignupScreen>{
  int _selectedItem=0;
  List page=[
    HomePage(),
    ResponsePage(),
    // Login(),
    Login()
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
