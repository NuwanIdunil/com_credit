import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key, this.title, this.actions,this.isLeading=false});
  final Widget? title;
  final List<Widget>? actions;
  final bool isLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:true ,
      backgroundColor: AppColors.white,
      toolbarHeight: Ui.padding2*6,
      actions: actions,
      centerTitle: true,
      title:  title,
      titleSpacing: 0.0,
      
       // alignment: Alignment.bottomCenter,

      
    );
  }
   Size get preferredSize => Size.fromHeight(Ui.padding2 * 8);

}
