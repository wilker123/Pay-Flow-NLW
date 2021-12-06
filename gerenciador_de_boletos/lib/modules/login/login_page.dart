import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/shared/themes/app_colors.dart';
import 'package:gerenciador_de_boletos/shared/themes/app_images.dart';
import 'package:gerenciador_de_boletos/shared/themes/app_text_styles.dart';
import 'package:gerenciador_de_boletos/shared/widgets/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              top: 30,
              left: 0, 
              right:0, 
              child: Image.asset(AppImages.person, width: 208,height: 280,),),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Positioned(child: Image.asset(AppImages.logomini),),
                  Padding(
                    padding: const EdgeInsets.only(top: 0,left: 70, right: 70),
                    child: Text("Organize seus boletos em um só lugar", style: TextStyles.titleHome, textAlign: TextAlign.center,),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 20.0),
                  child:  SocialLoginButton(
                    onTap: (){
                      
                    },
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}