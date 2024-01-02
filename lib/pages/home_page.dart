import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trending_video_app/controller/home_controller.dart';
import 'package:trending_video_app/pages/details_video_page.dart';
import 'package:trending_video_app/widget/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    HomeController mvc = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending Videos",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.2,
            color: Colors.grey.shade900
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Obx(()=>
                  ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: mvc.videoList.length,
                      itemBuilder: (context, int index){

                        var data = mvc.videoList[index];

                        return InkWell(
                          onTap: (){
                            print("Video url in homepage: ${data['manifest']}");
                            mvc.selectedVideoIndex.value = index;
                            Get.to(DetailsVideoPage(videoData: data,));

                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 192,
                                  width: Get.width,
                                  alignment: Alignment.center,
                                  child: Expanded(
                                    child: VideoPlayerWidget(
                                      videoUrl: '${data['manifest']}',
                                      thumbnailUrl: '${data['thumbnail']}',

                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 8),
                                  //padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage("${data['channel_image'].toString()}"),
                                          radius: 24,
                                        ),
                                      ),
                                      12.width,
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              utf8.decode(data['title'].toString().codeUnits),
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Color(0xFF1A202C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  overflow: TextOverflow.ellipsis,
                                                height: 1.5,
                                              ),
                                            ),
                                            8.height,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text("${data['viewers'].toString()} views",
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                  color: Color(0xFF718096),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Inter",
                                                  height: 1.2
                                                ),
                                                ),
                                                16.width,
                                                Text(mvc.formatDate(DateTime.parse(data['date_and_time'])),
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      color: Color(0xFF718096),
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Inter",
                                                      height: 1.2
                                                  ),
                                                )
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: (){
                                            toast("More");
                                          },
                                          child: Container(
                                            alignment: Alignment.topRight,
                                              child: Icon(Icons.more_vert_sharp, size: 24, color: Color(0xFFCBD5E0),)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      })
              )
            ],
          ),
        )
      ),
    );
  }
}
