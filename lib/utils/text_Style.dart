import '../colors.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TextStyles {
  static TextStyle graydefaultTextStyle = TextStyle(
    color: AppColors.gray,
    fontSize: Ui.getFontSize(1),
  );

  static TextStyle grayTextStylebig = TextStyle(
    color: AppColors.gray,
    fontSize: Ui.getFontSize(1.5),
  );
  static TextStyle versionText = TextStyle(
    color: AppColors.gray,
    fontSize: Ui.getFontSize(0.8),
  );
  static TextStyle BlackDefaultBigText = TextStyle(
    color: AppColors.black,
    fontSize: Ui.getFontSize(2),
  );

  static TextStyle BlackDefaultText = TextStyle(
    color: AppColors.black,
    fontSize: Ui.getFontSize(1.1),
  );

  static TextStyle defaultwhiteText = TextStyle(
    color: AppColors.white,
    fontSize: Ui.getFontSize(1),
  );

  static TextStyle BlackDefaultBoldText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: Ui.getFontSize(1.2),
  );

  static TextStyle BlackSmallBoldText = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: Ui.getFontSize(1),
  );

  static TextStyle BlackSmallSemiBold = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: Ui.getFontSize(1.5),
  );

  static TextStyle whiteTextSemiBold = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: Ui.getFontSize(1.2),
  );

  static TextStyle blackBigBoldText = TextStyle(
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

  static TextStyle blackdefaultsemibold = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w300,
    fontSize: Ui.getFontSize(1.2),
  );

  static TextStyle defaultUnderline = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: Ui.getFontSize(1),
    decoration: TextDecoration.underline,
  );
}
