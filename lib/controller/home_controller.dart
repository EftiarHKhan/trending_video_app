import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trending_video_app/api_provider/api_provider.dart';

class HomeController extends GetxController{

  ApiProvider apiProvider = ApiProvider();

  var videoList = [].obs;
  var selectedVideoIndex = 0.obs;
  var isFavourite = false.obs;
  var isLiked = false.obs;
  var commentController = TextEditingController().obs;
  int currentPage = 1;

@override
  void onInit() {
    super.onInit();
    fetchVideoList();
  }

  void fetchVideoList() async {
    var video = await apiProvider.getVideoList(currentPage.toString());
    if (video?['results'] != null) {
      videoList.addAll(video?['results']!);
      currentPage++;
    }

    videoList.value = video?['results']!;

    print("Video list from API: " + videoList.toString());
    print("video list length: " + videoList.length.toString());
  }

  String formatDate(DateTime dateTime) {
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(dateTime);
  }

  int calculateTimeDifference(DateTime releaseDateTime) {
    DateTime currentDateTime = DateTime.now();
    Duration difference = currentDateTime.difference(releaseDateTime);
    int days = difference.inDays;
    return days;
  }

}