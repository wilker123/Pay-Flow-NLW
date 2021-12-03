import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/modules/login/login_page.dart';

import 'modules/home/home_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

void main() {
  runApp(const MaterialApp(
    home: AppWidget(),
  ));  
}

class AppWidget extends StatelessWidget {
  const AppWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Day",
      theme: ThemeData(primaryColor: AppColors.primary),
      home: const LoginPage(),
    );
  }
}
