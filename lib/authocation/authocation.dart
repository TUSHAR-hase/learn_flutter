import 'dart:async';
import 'dart:core' ;


// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart' as native;
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart' hide String;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class auth_service {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signupUser({
    required String name,
    required String email,
    required String password,

    required String contect,
    required String address,
    required String Parent_contect,


  }) async {
    String res = 'Some error Occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          name.isNotEmpty || contect.isNotEmpty || address.isNotEmpty ||
          Parent_contect.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(cred.user!.uid);
        await _firestore.collection("users").doc(cred.user!.uid).set({
          'name': name,
          'uid': cred.user!.uid,
          'email': email,
          'contect': contect,
          'address': address,
          'Parent_number': Parent_contect,

        }
        );

        res = "success";
      }
    } catch (err) {
     print(err);
      
    }
    return res;
  }
  Future<String>loginuser({
    required String email,
    required String password
})async{
    String res="some error show";
    try{
      if(email.isNotEmpty||password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
      res="success";
      }
      else{
        res="please Enter All field";
      }
    }catch(e){
return e.toString();
    }
    return res;
  }
}
