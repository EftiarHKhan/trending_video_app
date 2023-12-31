import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                  itemBuilder: (context, int index){
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
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                          color: Colors.green.shade100
                                      ),
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                ),
                                 Expanded(
                                   flex: 4,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Arab Neta shghskj shkgshg sjghfskgh s",
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
                                          Text("53,245 views"),
                                          Text("Feb 21, 2021")
                                        ],
                                      ),

                                    ],
                                                                 ),
                                 ),
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
            ],
          ),
        )
      ),
    );
  }
}
