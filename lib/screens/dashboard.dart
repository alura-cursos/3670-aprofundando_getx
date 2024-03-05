import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidflow/components/custom_button.dart';
import 'package:vidflow/components/header.dart';
import 'package:vidflow/components/video_card.dart';
import 'package:vidflow/model/video.dart';
import 'package:vidflow/screens/upload.dart';
import 'package:vidflow/utils/colors.dart';
import 'package:vidflow/utils/images.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueVoid,
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16, 64, 16, 28),
        child: _EmptyDashboard(),
      ),
    );
  }
}

class _EmptyDashboard extends StatelessWidget {
  const _EmptyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 72.0, horizontal: 31),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset(AppImages.emptyDashboard),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Text(
                      "Você ainda não postou nenhum vídeo em seu perfil, que tal começar?"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomButton(
                      onTap: () {Get.to(() => Upload());},
                      text: "Upload de vídeo",
                      icon: Icons.upload,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FullDashboard extends StatelessWidget {
  const _FullDashboard({super.key, required this.videosList});

  final List<Video> videosList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Header(),),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Text(
            "Seus vídeos",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.blueAccent,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      SliverList.builder(
        itemCount: videosList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: VideoCard(
              imageURL: videosList[index].thumbURL,
              videoTitle: videosList[index].title),
        ),
      ),
    ]);
  }
}
