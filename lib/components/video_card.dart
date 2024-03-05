import 'package:flutter/material.dart';
import 'package:vidflow/utils/colors.dart';
import 'package:vidflow/utils/images.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.imageURL, required this.videoTitle});

  final String imageURL;
  final String videoTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 202,
          width: 360,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageURL),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImages.profilePicture),
                ),
              ),
            ),
            Flexible(
              child: Text(
                videoTitle,
                style: TextStyle(
                  color: AppColors.mediumGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
