import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  const CustomTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray2,
      height: Ui.getPadding(7),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          color: AppColors.red,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        // labelColor: const Color.fromARGB(255, 255, 255, 255),
        dividerColor: AppColors.gray2,
        unselectedLabelStyle: TextStyles.BlackSmallBoldText,
        labelStyle: TextStyles.whiteBoldText,

        tabs: const [
          Tab(
            text: "One Time",
          ),
          Tab(
            text: "Saved  Payees",
          ),
        ],
      ),
    );
  }
}
