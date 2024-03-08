import 'package:get/get.dart';
import 'package:vidflow/model/video.dart';
import 'package:vidflow/services/videos_api.dart';

class VideosController extends GetxController {
  final videoLoading = true.obs;
  final RxList<Video> videos = <Video>[].obs;
  final VideosApi videosApi = Get.put(VideosApi());

  Future<void> getAllFromUser() async {
    try {
      videoLoading(true);
      Response<List<Video>> response = await videosApi.getAllFromUser(2);
      if(response.statusCode == 200) {
        videos(response.body);
      }
    } finally {
      videoLoading(false);
    }
  }
}