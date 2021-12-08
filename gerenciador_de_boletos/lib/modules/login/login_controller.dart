import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/shared/auth/auth_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(response, context);
      print(response);
    } catch (errar) {
      authController.setUser(null, context);
      print(errar);
    }
  }
}
