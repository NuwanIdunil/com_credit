import 'package:com_credit_mobile/colors.dart';
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

class PinEnterScreen extends StatefulWidget {
  const PinEnterScreen({super.key});

  @override
  State<PinEnterScreen> createState() => _PinEnterScreenState();
}

class _PinEnterScreenState extends State<PinEnterScreen> {
  int pinindex = 0;
  String? SingInPIN;
  TextEditingController _pinTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: PinCreateComponent(
          _pinTextController,
          pinindex: pinindex,
          onChanged: (pin) {
            setState(() {
              pinindex = pin.length;
              print(pin);
            });
            if (pin.length >= 4) {
              Future.delayed(const Duration(milliseconds: 250)).then((value) {
                pushScreen(
                  context,
                  ScreenRoutes.toPinConformScreen,
                  arguments: pin,
                ).then((value) {
                  _pinTextController.clear();
                  print("current pin $pin");

                  setState(() {
                    pinindex = _pinTextController.text.length;
                  });
                });
              });
            }
          },
        ));
  }
}
