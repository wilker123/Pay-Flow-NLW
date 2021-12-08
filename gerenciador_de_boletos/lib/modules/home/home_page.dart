import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/modules/home/home_controller.dart';
import 'package:gerenciador_de_boletos/shared/themes/app_colors.dart';
import 'package:gerenciador_de_boletos/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    Container(color: Colors.red,),
    Container(color: Colors.blue,)
  ];
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
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: (){
                controller.setPage(0);
                setState(() {});
              }, 
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
              onPressed: (){
                controller.setPage(1);
                setState(() {});
              }, 
              icon: Icon(Icons.description_outlined),
              color: AppColors.body,
            ),
          ],
        ),
      ),
    );
  }
}