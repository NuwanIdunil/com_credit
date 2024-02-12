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

class PinConformScreen extends StatefulWidget {
  final String privousPin;
  const PinConformScreen(this.privousPin, {super.key});

  @override
  State<PinConformScreen> createState() => _PinConformScreenState();
}

class _PinConformScreenState extends State<PinConformScreen> {
  int pinindex = 0;
  bool pinMismatch = true;

  final _conformpinTextController = TextEditingController();
  @override
  void initState() {
    print("privous pin is ${widget.privousPin}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: PinCreateComponent(
          _conformpinTextController,
          pinMismatch: pinMismatch,
          pinConfirm: true,
          pinindex: pinindex,
          onChanged: (pin) {
            setState(() {
              pinindex = pin.length;
            });
            if (widget.privousPin == pin) {
              setState(() {
                pinMismatch = false;
              });
            } else {
              setState(() {
                pinMismatch = true;
              });
            }
            if (pin.length >= 4 && pinMismatch) {
              resetProcess();
            }

            pin.length == 4 && !pinMismatch
                ? pushScreen(context, ScreenRoutes.toSaveDeviceNameScreen)
                : null;
          },
        ));
  }

  void resetProcess() {
    setState(() {
      pinMismatch = true;
      showAlertDialog(context);
      print("this screen Password contoller ${_conformpinTextController.text}");
      _conformpinTextController.clear();
      pinindex = _conformpinTextController.text.length;
      print(
          "this screen Password contoller after clear ${_conformpinTextController.text}");
    });
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    style: ElevatedButton.styleFrom(
      primary: AppColors.red,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Pin are not Matched"),
    content: Text("Enter Correct Pin"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
