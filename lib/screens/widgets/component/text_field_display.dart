import 'dart:ffi';

import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class TextFiledDisplay extends StatelessWidget {
  final String? text;
  final String? endtext;
  final VoidCallback? ontapfiled;
  final IconData? icon;
  final TextStyle? textStyle;
  const TextFiledDisplay(
      {super.key,
      this.text,
      this.ontapfiled,
      this.icon,
      this.textStyle,
      this.endtext});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontapfiled!();
      },
      child: Container(
        height: Ui.getPadding(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Ui.getRadius(1.5)),
          color: AppColors.graylight,
        ),
        width: ScreenUtil.width,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Ui.getPadding(2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text ?? "",
                    style: textStyle ?? TextStyles.blackdefaultsemibold,
                  ),
                  Icon(icon),
                  Text(
                    endtext?.isNotEmpty ?? false ? endtext! : ' ',
                    style: TextStyles.BlackSmallBoldText,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
