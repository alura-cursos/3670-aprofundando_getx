import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vidflow/model/video.dart';
import 'package:vidflow/screens/dashboard.dart';
import 'package:vidflow/services/videos_api.dart';
import 'package:vidflow/utils/snackbars.dart';

class VideosController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllFromUser();
  }

  final videoLoading = true.obs;
  final RxList<Video> videos = <Video>[].obs;
  final VideosApi videosApi = Get.put(VideosApi());

  final session = GetStorage().read("session");

  final TextEditingController textVideoTitleController = TextEditingController();
  final TextEditingController textVideoThumbNailController = TextEditingController();

  Future<void> getAllFromUser() async {
    try {
      videoLoading(true);
      Response<List<Video>> response = await videosApi.getAllFromUser(session["user"]["id"]);
      if(response.statusCode == 200) {
        videos(response.body);
      }
    } finally {
      videoLoading(false);
    }
  }

  Future<void> create() async {
    final Video video = Video(thumbURL: textVideoThumbNailController.text, title: textVideoTitleController.text, userId: session['user']['id']);
    try {
      Response<void> response = await videosApi.create(video, session['accessToken']);
      if(response.statusCode == 201) {
        AppSnacks.getSuccessUpload();
        Get.offAll(() => Dashboard());
        getAllFromUser();
      } else {
        AppSnacks.getErrorUpload();
        throw response.statusText!;
      }
    } catch (e) {
      print(e);
    }
  }
}