import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerenciador_de_boletos/modules/insert_boleto/insert_boleto_page.dart';

import 'modules/barcode_scanner/barcode_scanner_page.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {

  AppWidget({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Day",
      theme: ThemeData(primarySwatch: Colors.orange, primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
        "/barcodeScanner": (context) => const BarcodeScannerPage(),
        "/insert_boleto ": (context) => const InsertBoletoPage(),
      },
    );
  }
}