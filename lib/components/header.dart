import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidflow/components/custom_button.dart';
import 'package:vidflow/screens/upload.dart';
import 'package:vidflow/utils/colors.dart';
import 'package:vidflow/utils/images.dart';

class Header extends StatelessWidget {
  Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 38.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                AppImages.logo,
                height: 28,
              ),
              CustomButton(
                onTap: () {Get.to(() => Upload());},
                text: "Upload de vídeo",
                icon: Icons.upload,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "Título do canal",
            style: TextStyle(
              color: AppColors.blueAccent,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          "@seucanal",
          style: TextStyle(
            color: AppColors.blueAccent,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          width: double.infinity,
          height: 1,
          decoration: BoxDecoration(
            color: AppColors.mediumGrey,
          ),
        ),
      ],
    );
  }
}
