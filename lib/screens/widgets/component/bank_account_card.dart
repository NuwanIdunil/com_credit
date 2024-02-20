import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class BankAccountCard extends StatefulWidget {
  final String? accountNumber;
  final String? bank;
  final String? icon;
  const BankAccountCard({super.key, this.accountNumber, this.bank, this.icon});

  @override
  State<BankAccountCard> createState() => _BankAccountCardState();
}

class _BankAccountCardState extends State<BankAccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Ui.getPadding(20),
      //height: Ui.getPadding(10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray),
          borderRadius: BorderRadius.circular(Ui.getRadius(2))),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            widget.icon!,
            width: Ui.getPadding(10),
          ),
          ConstColumnSpacer(2),
          Text(
            "My  ${widget.bank ?? " "} ",
            style: TextStyles.BlackDefaultText,
          ),
          Text(
            "${widget.accountNumber ?? " "} ",
            style: TextStyles.BlackDefaultText,
          ),
        ]),
      ),
    );
  }
}
