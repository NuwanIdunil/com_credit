import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:flutter/material.dart';

import '../../utils/text_Style.dart';

class MainButton extends StatefulWidget {
   const MainButton({
    required this.onpressed,
    required this.text
   });
   final void Function() onpressed;
   final String text;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
           
          style: ElevatedButton.styleFrom(
            primary: AppColors.red,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Set the border radius you want
    ),
           minimumSize: Size(ScreenUtil.width*0.75, 55.0),
          ),
          onPressed: () {
            widget.onpressed(); 
          },
          child: Text(widget.text,style: TextStyles.whiteBoldText,),
        );
  }
}