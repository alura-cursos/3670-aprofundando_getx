import 'package:flutter/material.dart';
import 'package:vidflow/components/custom_button.dart';
import 'package:vidflow/components/custom_field.dart';
import 'package:vidflow/components/header.dart';
import 'package:vidflow/utils/colors.dart';

class Upload extends StatelessWidget {
  Upload({super.key});

  final TextEditingController textVideoTitleController = TextEditingController();
  final TextEditingController textVideoThumbNailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueVoid,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Header(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text("Adicionar vídeo", style: TextStyle(
                color: AppColors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomField(label: "Nome do vídeo", textController: textVideoTitleController),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomField(label: "URL do thumbnail", textController: textVideoThumbNailController),
            ),
            Row(
              children: <Widget>[
                CustomButton(onTap: (){}, text: "Adicionar vídeo", icon: Icons.login,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
