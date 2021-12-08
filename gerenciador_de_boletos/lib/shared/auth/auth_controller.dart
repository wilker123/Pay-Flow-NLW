import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/modules/home/home_page.dart';
import 'package:gerenciador_de_boletos/modules/login/login_page.dart';

class AuthController{
  var _isAuthenticated = false;
  var _user;

  get user => user;

  void setUser(var user, BuildContext context){
    if(user != null){
      _user = user;
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(context, "/home");
    }else{
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

} 