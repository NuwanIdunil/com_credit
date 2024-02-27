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
  bool isDraggable = false,
  bool isviewInsets = false,
}) async {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Ui.getRadius(5)), // Adjust the value as needed
      ),
    ),
    builder: (BuildContext context) {
      return isDraggable
          ? DraggableScrollableSheet(
              initialChildSize: 0.8,
              // maxChildSize: 0.8,
              minChildSize: 0.5,
              maxChildSize: 0.8,
              builder: (context, scrollController) => Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Ui.getRadius(5)),
                    topRight: Radius.circular(Ui.getRadius(5)),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(1)),
                child: ListView(
                  controller: scrollController,
                  children: children,
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.only(
                  bottom: isviewInsets
                      ? MediaQuery.of(context).viewInsets.bottom
                      : 0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Ui.getRadius(5)),
                  topRight: Radius.circular(Ui.getRadius(5)),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
              ),
            );
    },
  );
}
