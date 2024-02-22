import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/screens/widgets/component/drop_down.menu.dart';
import 'package:com_credit_mobile/screens/widgets/component/shareButtom.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class PeerToPeerReciveScreen extends StatefulWidget {
  const PeerToPeerReciveScreen({super.key});

  @override
  State<PeerToPeerReciveScreen> createState() => _PeerToPeerReciveScreenState();
}

class _PeerToPeerReciveScreenState extends State<PeerToPeerReciveScreen> {
  var dropdownItems = [
    "Primary Accounts",
    "Savings Account",
    "Credit Card",
    "Other Accounts",
  ];
  String dropdownvalue = 'Primary Accounts';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ConstColumnSpacer(1),
        Text(
          "Select Your Accoount",
          style: TextStyles.BlackDefaultText,
        ),
        const ConstColumnSpacer(1),
        DropdownFormField(
            dropdownvalue: dropdownvalue, dropdownItems: dropdownItems),
        Container(
          width: Ui.getPadding(35),
          height: Ui.getPadding(35),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFC01621), // Set border color
              width: 1.0, // Set border width
            ),
          ),
        ),
        Container(color: AppColors.graylight, child: const Sharebuttom())
      ]),
    );
  }
}
