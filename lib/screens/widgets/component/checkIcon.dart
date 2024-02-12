import 'package:com_credit_mobile/colors.dart';
import 'package:flutter/material.dart';

class CheckIcon extends StatelessWidget {
 final Color? border_color;
 final Color? backgroundColor;
  final Color? iconColor;
 
  CheckIcon(
      // ignore: non_constant_identifier_names
      {super.key,this.border_color, this.backgroundColor,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Material(
     color: backgroundColor ?? AppColors.white,
      clipBehavior: Clip.antiAlias,
      shape: CircleBorder(side: BorderSide(color: border_color?? AppColors.gray)),
      child:  Icon(Icons.check,color:iconColor??AppColors.gray, size: 15,),
    );
  }
}
