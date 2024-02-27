import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;
  final List<Widget> tabviewElements;
  Function? onChanged;
  CustomTabBar(
      {super.key,
      required this.tabController,
      required this.tabviewElements,
      this.onChanged});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Ui.padding2),
      child: Container(
        color: AppColors.gray2,
        height: Ui.getPadding(7),
        child: TabBar(
            onTap: (value) {
              widget.onChanged!();
            },
            controller: widget.tabController,
            indicator: BoxDecoration(
              color: AppColors.red,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            // labelColor: const Color.fromARGB(255, 255, 255, 255),
            dividerColor: AppColors.gray2,
            unselectedLabelStyle: TextStyles.BlackSmallBoldText,
            labelStyle: TextStyles.whiteBoldText,
            tabs: widget.tabviewElements),
      ),
    );
  }
}
