import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidflow/components/custom_button.dart';
import 'package:vidflow/components/custom_field.dart';
import 'package:vidflow/components/header.dart';
import 'package:vidflow/controllers/videos_controller.dart';
import 'package:vidflow/utils/colors.dart';

class Upload extends StatelessWidget {
  Upload({super.key});

  final VideosController videosController = Get.find<VideosController>();

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
              child: CustomField(label: "Nome do vídeo", textController: videosController.textVideoTitleController),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomField(label: "URL do thumbnail", textController: videosController.textVideoThumbNailController),
            ),
            Row(
              children: <Widget>[
                CustomButton(onTap: (){
                  videosController.create();
                }, text: "Adicionar vídeo", icon: Icons.login,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
