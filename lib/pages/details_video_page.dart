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
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 210,
                  width: Get.width,
                  child:
                      VideoPlayerWidget(
                        videoUrl: '${data['manifest']}',
                      ),

              ),
              16.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      data['title'].toString(),
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    8.height,
                    Row(
                      children: [
                        Text("${data['viewers'].toString()} views",
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                        16.width,
                        Text("${mvc.calculateTimeDifference(DateTime.parse(data['date_and_time'].toString())).toString()} days ago",
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                      ],
                    ),
                    8.height,
                    Obx(()=>
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            CardView(
                              icon: mvc.isFavourite.value ? Icons.favorite : Icons.favorite_border_outlined,
                              iconColor: mvc.isFavourite.value ? Colors.red : Colors.grey,
                              text: "MASH ALLAH (12K)",
                              ontap: (){
                                mvc.isFavourite.value = !mvc.isFavourite.value;
                              },
                              flex: 5,
                            ),
                            8.width,
                            CardView(
                              icon: mvc.isLiked.value ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                              iconColor: mvc.isLiked.value ? Colors.blue : Colors.grey,
                              text: "Like (12K)",
                              ontap: (){
                                mvc.isLiked.value = !mvc.isLiked.value;
                              },
                              flex: 4,
                            ),
                            8.width,
                            CardView(
                              icon: Icons.share_outlined,
                              iconColor: Colors.grey,
                              text: "SHARE",
                              ontap: (){
                                toast("Share");
                              },
                              flex: 3,
                            ),
                            8.width,
                            CardView(
                              icon: Icons.flag_outlined,
                              iconColor: Colors.grey,
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
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("${data['channel_image'].toString()}"),
                              radius: 20,
                            ),
                            8.width,
                            Column(
                              children: [
                                Text(data['channel_name'].toString(), style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),),
                                Text("${data['channel_subscriber'].toString()} Subscribers", style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200
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
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.blue
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add, color: Colors.white,),
                                4.width,
                                Text("Subscribe", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
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
                color: Colors.grey,
                thickness: 1,
              ),
              16.height,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Comments 7.5k",
                            style: TextStyle(
                                fontSize: 12
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                InkWell(
                                    onTap: (){},
                                    child:  Icon(Icons.keyboard_arrow_up, size: 12,)
                                ),
                                InkWell(
                                    onTap: (){},
                                    child:  Icon(Icons.keyboard_arrow_down, size: 12,)
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      16.height,
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Add Comment",
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            ),
                            suffixIcon: InkWell(
                              onTap: (){

                              },
                              child: Icon(Icons.send),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    height: 1
                                  ),),
                                  8.width,
                                  Text("2 days ago", style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.grey,
                                    height: 1
                                  ),),

                                ],
                              ),
                              8.height,
                              Text("I love this video. It makes me happy",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis
                                ),),
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
    );
  }
}
