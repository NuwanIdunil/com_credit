import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpInputField extends StatelessWidget {
  const OtpInputField(
    this.controller, {
    super.key,
    this.focusNode,
    this.onCompleted,
    this.onChanged,
    this.enable = true,
  });

  final OTPTextEditController controller;
  final FocusNode? focusNode;
  final void Function(String otp)? onCompleted;
  final void Function(String otp)? onChanged;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.transparent,
      width: ScreenUtil.width * 0.8,
      child: PinCodeTextField(
        enabled: enable,
        autoFocus: true,
        appContext: context,
        focusNode: focusNode,
        length: 6,
        blinkWhenObscuring: true,
        animationType: AnimationType.scale,
        autoDisposeControllers: false,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(Ui.borderRadius),
          fieldHeight: 60,
          fieldWidth: 50,
          activeFillColor: AppColors.gray2,
          activeColor: AppColors.gray2,
          inactiveFillColor: AppColors.gray2,
          inactiveColor: AppColors.gray2,
          selectedFillColor: AppColors.gray2,
          selectedColor: AppColors.gray2,
        ),
        cursorColor: AppColors.black,
        animationDuration: const Duration(milliseconds: 250),
        enableActiveFill: true,
        // errorAnimationController: errorController,
        enablePinAutofill: false,
        // inputFormatters: [onlyNumbers()],
        // textStyle: TextStyles.startLayoutTitle,
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(),
        boxShadows: [
          BoxShadow(
            color: AppColors.gray.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
        onCompleted: onCompleted,
        onChanged: (value) {
          onChanged?.call(value);
        },
      ),
    );
  }
}
