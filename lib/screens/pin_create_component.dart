import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/pin_number_pad.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/pin_length_indicator.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class PinCreateComponent extends StatefulWidget {
  const PinCreateComponent(
    this.controller, {
    super.key,
    required this.onChanged,
    this.pinConfirm = false,
    this.pinMismatch = false,
    this.pinindex = 0,
  });
  final TextEditingController controller;
  final void Function(String pin) onChanged;
  final bool pinConfirm;
  final bool pinMismatch;
  final int pinindex;

  @override
  State<PinCreateComponent> createState() => _PinCreateComponentState();
}

class _PinCreateComponentState extends State<PinCreateComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   backgroundColor: AppColors.white,
      //   // foregroundColor: AppColors.white,
      //   flexibleSpace: Container(
      //     color: AppColors.white,
      //   ),
      // ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ColumnSpacer(4),
                Image.asset(AppIcons.logo, height: 100),
                ColumnSpacer(1),
                Text(
                  widget.pinConfirm ? "confirm_pin" : "Enter Your PIN",
                  style: TextStyles.defaultText1Bold,
                ),
                ColumnSpacer(1),
                Text(
                  widget.pinMismatch
                      ? "please retype the PIN entered"
                      : "[secure idea]",
                  style: TextStyles.greyTextStyle2,
                ),
                ColumnSpacer(3),
                PinLengthIndicator(length: widget.pinindex),
              ],
            ),
            ColumnSpacer(2),
            SizedBox(
              // color: AppColors.black,
              //  height: ScreenUtil.height * 0.5,
              width: ScreenUtil.width * 0.60,
              child: PinNumberPad(
                controller: widget.controller,
                onChanged: widget.onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
