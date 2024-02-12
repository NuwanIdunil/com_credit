import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:flutter/material.dart';


class RowSpacer extends StatelessWidget {
  const RowSpacer(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:ScreenUtil.width*0.1*(size) ,
    );
    
    
  }
}