import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CardView extends StatelessWidget {
  IconData icon;
  Color? iconColor;
  VoidCallback? ontap;
  String text;
  int? flex;
  CardView({super.key,
    required this.icon,
    this.ontap,
    required this.text,
    this.iconColor,
    this.flex
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
              width: 1
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 18,),
              4.height,
              Text(text, style: TextStyle(
                fontSize: 10
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
