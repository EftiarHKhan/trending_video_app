import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trending_video_app/controller/home_controller.dart';

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
        title: const Text(
          "Trending Videos",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Obx(()=>
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: mvc.videoList.length,
                      itemBuilder: (context, int index){

                        var data = mvc.videoList[index];

                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Get.height * .2,
                                width: Get.width,
                                color: Colors.grey,
                                alignment: Alignment.center,
                                child: Text(
                                    "Video"
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage("${data['channel_image'].toString()}"),
                                        radius: 30,
                                      ),
                                    ),
                                    16.width,
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(data['title'].toString(),
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                overflow: TextOverflow.ellipsis
                                            ),
                                          ),
                                          8.height,
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${data['viewers'].toString()} views"),
                                              Text("${data['date_and_time'].toString().substring(0,10)}")
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                    16.width,
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){

                                        },
                                        child: Icon(Icons.more_vert_sharp, size: 24,),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                            ],
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
