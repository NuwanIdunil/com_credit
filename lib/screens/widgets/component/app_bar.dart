import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';

import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.actions,
      this.isLeading = false,
      this.iscolorApply = true,
      this.IsShowtabBar = false});

  TabBar get _tabBar => const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.flight)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_car)),
        ],
      );
  final String title;
  final List<Widget>? actions;
  final bool isLeading;
  final bool IsShowtabBar;
  final bool iscolorApply;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: iscolorApply ? AppColors.white : AppColors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: Ui.getPadding(3)),
        child: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor:
              iscolorApply ? AppColors.white : AppColors.transparent,
          actions: actions,
          centerTitle: true,
          title: Text(
            title,
            style: TextStyles.blackBigBoldText,
          ),
          elevation: 0.0,
          titleSpacing: 0.0,
          flexibleSpace: Container(
            color: AppColors.white,
          ),

          // alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(Ui.padding2 * 4);
}

class AppColor {}
