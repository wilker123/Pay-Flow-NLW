import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/shared/themes/app_colors.dart';
import 'package:gerenciador_de_boletos/shared/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: ListTile(
           title: Text.rich(TextSpan(text: "Olá", style: TextStyles.titleRegular, 
            children: [
              TextSpan(text: "Gabul", style: TextStyles.titleBoldBackground)
            ]),
           ),
            
            subtitle: Text("Matenha suas contas em dia", style: TextStyles.captionShape,),
            trailing: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(50)), 
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.home),
              color: AppColors.primary,
            ),
            GestureDetector(
              onTap: (){
                print("Clicou");
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(5)),
                child: Icon(Icons.add_box_outlined),
              ),
            ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.description_outlined),
              color: AppColors.body,
            ),
          ],
        ),
      ),
    );
  }
}