import 'package:get/get.dart';
import 'package:trending_video_app/api_provider/api_provider.dart';

class HomeController extends GetxController{

  ApiProvider apiProvider = ApiProvider();

  var videoList = [].obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchVideoList();
  }

  void fetchVideoList() async {
    var video = await apiProvider.getVideoList("1");
    videoList.value = video?['results']!;
    print("Video list from API: ");
    print(videoList);
    print("video list length: " + videoList.length.toString());
  }

}