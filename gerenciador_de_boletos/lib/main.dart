
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/app_widget.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppWidget());

}

class AppFirebase extends StatefulWidget {
  const AppFirebase({ Key? key }) : super(key: key);

  @override
  State<AppFirebase> createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {

  // ignore: unused_field
  final Future<FirebaseApp> _initialization =  Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Material(
            child: Center(
              child: Text("Não foi possível iniciar o firebase", textDirection: TextDirection.ltr,),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const AppWidget();
        }
        return const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}