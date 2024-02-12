import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:flutter/material.dart';


class ConstColumnSpacer extends StatelessWidget {
  const ConstColumnSpacer(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:Ui.getPadding(size),
    );
  }
}