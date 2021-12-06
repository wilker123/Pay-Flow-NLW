
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppFirebase());

}

class AppFirebase extends StatefulWidget {
  const AppFirebase({ Key? key }) : super(key: key);

  @override
  State<AppFirebase> createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {

  Future<FirebaseApp> _initializeFirebase =  Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}