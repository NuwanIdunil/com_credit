import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/otp_input_field.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';

Future<void> showBottomSheetModal(
  BuildContext context, {
  OTPTextEditController? otpController,
  List<Widget> children = const <Widget>[],
  double? sheetHeight,
}) async {
  showModalBottomSheet<void>(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Ui.getRadius(5)), // Adjust the value as needed
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? Ui.getPadding(0)
                : Ui.getPadding(0)),
        child: Container(
          color: AppColors.white,
          height: sheetHeight,
          child: SingleChildScrollView(child: Column(children: children)),
        ),
      );
    },
  );
}
