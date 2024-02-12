import '../colors.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TextStyles {
  static TextStyle greyTextStyle = TextStyle(
    color: AppColors.gray,
    fontSize: Ui.getFontSize(1),
  );

  static TextStyle greyTextStyle2 = TextStyle(
    color: AppColors.gray,
    fontSize: Ui.getFontSize(1.5),
  );
  static TextStyle versionText = TextStyle(
    color: AppColors.gray,
    fontSize: Ui.getFontSize(0.8),
  );
  static TextStyle defaultText2 = TextStyle(
    color: AppColors.black,
    fontSize: Ui.getFontSize(2),
  );

  static TextStyle defaultText = TextStyle(
    color: AppColors.black,
    fontSize: Ui.getFontSize(1.1),
  );

  static TextStyle defaultwhiteText = TextStyle(
    color: AppColors.white,
    fontSize: Ui.getFontSize(1),
  );

  static TextStyle defaultBoldText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: Ui.getFontSize(1.2),
  );

 static TextStyle BoldText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: Ui.getFontSize(1),
  );
  
  static TextStyle defaultTextSmallSemiBold = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: Ui.getFontSize(1.5),
  );

    static TextStyle whiteTextSemiBold = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: Ui.getFontSize(1.2),
  );

  static TextStyle defaultText1Bold = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: Ui.getFontSize(1.4),
  );
  static TextStyle whiteBoldText = TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: Ui.getFontSize(1.2));

  static TextStyle defaultTextBoldUnderline = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: Ui.getFontSize(1.2),
    decoration: TextDecoration.underline,
  );

  static TextStyle defaultTextboldgray = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w300,
    fontSize: Ui.getFontSize(1.2),
  );

  static TextStyle defaultTextUnderline = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: Ui.getFontSize(1),
    decoration: TextDecoration.underline,
  );
}
