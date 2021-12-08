import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(UserModel? user, BuildContext context){
    if(user != null){
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, "/home");
    }else{
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds:2));
    if(instance.containsKey("user")){
      final json = await instance.get("user") as String;
      setUser(UserModel.fromJson(json), context);
      return;
    }else{
      setUser(null, context);
    }
   
  }


} 