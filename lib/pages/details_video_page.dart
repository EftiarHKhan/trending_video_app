import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:trending_video_app/controller/home_controller.dart';
import 'package:trending_video_app/widget/card_view.dart';
import 'package:trending_video_app/widget/video_player.dart';

class DetailsVideoPage extends StatefulWidget {
  final Map<String, dynamic> videoData;
   DetailsVideoPage({super.key, required this.videoData});

  @override
  State<DetailsVideoPage> createState() => _DetailsVideoPageState();
}

class _DetailsVideoPageState extends State<DetailsVideoPage> {
  @override
  Widget build(BuildContext context) {

    HomeController mvc = Get.find<HomeController>();

    var data = widget.videoData;
    print("Video details : ${data}");

    return WillPopScope(
      onWillPop: () async{
        mvc.selectedVideoIndex.refresh();
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF7FAFC),
        body: Container(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: 210,
                        width: Get.width,
                        alignment: Alignment.topCenter,
                        child:
                        Expanded(
                          child: VideoPlayerWidget(
                                videoUrl: '${data['manifest']}',
                                thumbnailUrl: '${data['thumbnail']}',
                              ),
                        ),

                    ),
                    Positioned(
                      top: 16,
                        left: 16,
                        child: InkWell(
                          onTap: (){
                            Get.back();
                          },
                            child: Icon(Icons.arrow_back_outlined, color: Colors.grey.shade600,))
                    ),
                  ],
                ),
                16.height,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        utf8.decode(data['title'].toString().codeUnits),
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          height: 1.5
                        ),
                      ),
                      8.height,
                      Row(
                        children: [
                          Text("${data['viewers'].toString()} views",
                            style: TextStyle(
                                fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                              color: Colors.grey.shade600,
                              fontFamily: "Poppins"
                            ),
                          ),
                          16.width,
                          Text("${mvc.calculateTimeDifference(DateTime.parse(data['date_and_time'].toString())).toString()} days ago",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                                color: Colors.grey.shade600,
                                fontFamily: "Poppins"
                            ),
                          ),
                        ],
                      ),
                      16.height,
                      Obx(()=>
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              CardView(
                                icon: mvc.isFavourite.value ? Icons.favorite : Icons.favorite_border_outlined,
                                iconColor: mvc.isFavourite.value ? Colors.red : Colors.grey.shade600,
                                text: "MASH ALLAH (12K)",
                                ontap: (){
                                  mvc.isFavourite.value = !mvc.isFavourite.value;
                                },
                                flex: 6,
                              ),
                              8.width,
                              CardView(
                                icon: mvc.isLiked.value ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                                iconColor: mvc.isLiked.value ? Colors.blue : Colors.grey.shade600,
                                text: "Like (12K)",
                                ontap: (){
                                  mvc.isLiked.value = !mvc.isLiked.value;
                                },
                                flex: 4,
                              ),
                              8.width,
                              CardView(
                                icon: Icons.share_outlined,
                                iconColor: Colors.grey.shade600,
                                text: "SHARE",
                                ontap: (){
                                  toast("Share");
                                },
                                flex: 3,
                              ),
                              8.width,
                              CardView(
                                icon: Icons.flag_outlined,
                                iconColor: Colors.grey.shade600,
                                text: "REPORT",
                                ontap: (){
                                  toast("Report");
                                },
                                flex: 3,
                              ),

                            ],
                          ),
                      ),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage("${data['channel_image'].toString()}"),
                                radius: 20,
                              ),
                              8.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data['channel_name'].toString(), style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Colors.grey.shade900,
                                    height: 1.5
                                  ),),
                                  Text("${data['channel_subscriber'].toString()} Subscribers", style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600,
                                    fontFamily: "Poppins",
                                  ),),

                                ],
                              ),
                            ],
                          ),
                          8.width,
                          InkWell(
                            onTap: (){
                              toast("Subscribed");
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xFF3898FC)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, color: Colors.white, size: 16,),
                                  8.width,
                                  const Text("Subscribe", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5
                                  ),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                16.height,
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
                16.height,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Comments  7.5k",
                              style: TextStyle(
                                  fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: Colors.grey.shade600,
                                fontFamily: "Poppins"
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  InkWell(
                                      onTap: (){},
                                      child:  Icon(Icons.keyboard_arrow_up, size: 8, weight: 4, color: Colors.grey.shade600,)
                                  ),
                                  InkWell(
                                      onTap: (){},
                                      child:  Icon(Icons.keyboard_arrow_down, size: 8,weight: 4, color: Colors.grey.shade600,)
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        10.height,
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Add Comment",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                                height: 1,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins"
                              ),
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  )
                              ),
                              suffixIcon: InkWell(
                                onTap: (){

                                },
                                child: Icon(Icons.send, color: Colors.grey.shade500,),
                              )
                          ),
                        ),
                        16.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("${data['channel_image'].toString()}"),
                              radius: 16,
                            ),
                            8.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Fahmida Khanom", style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade600,
                                      fontFamily: "Poppins",
                                      height: 1
                                    ),),
                                    8.width,
                                    Text("2 days ago", style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade600,
                                      height: 1
                                    ),),

                                  ],
                                ),
                                8.height,
                                Container(
                                  width: Get.width * .8,
                                  child: Text("হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade700,
                                        overflow: TextOverflow.ellipsis,
                                      fontFamily: "Hind Siliguri"
                                    ),),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
