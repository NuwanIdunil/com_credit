import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/pin_number_pad.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/pin_create_component.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/pin_length_indicator.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class SignInPinEnterScreen extends StatefulWidget {
  const SignInPinEnterScreen({super.key});

  @override
  State<SignInPinEnterScreen> createState() => _SignInPinEnterScreenState();
}

class _SignInPinEnterScreenState extends State<SignInPinEnterScreen> {
  int pinindex = 0;
  String? SingInPIN;
  TextEditingController _pinTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          PinCreateComponent(
            _pinTextController,
            pinindex: pinindex,
            onChanged: (pin) {
              setState(() {
                pinindex = pin.length;
              });
              if (pin.length >= 4) {
                Future.delayed(const Duration(milliseconds: 250)).then((value) {
                  _pinTextController.clear();

                  setState(() {
                    pinindex = _pinTextController.text.length;
                  });
                });
              }
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Ui.getPadding(2),
            child: InkWell(
              onTap: () {
                pushScreen(context, ScreenRoutes.toForgetPasswordSreen);
              },
              child: Center(
                child: Text(
                  "Foget PIN",
                  style: TextStyles.grayTextStylebig.copyWith(
                    fontSize: Ui.getFontSize(1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
