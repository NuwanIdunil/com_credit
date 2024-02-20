import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/models/foun_tansfer_details.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTile extends StatelessWidget {
  final FundTransferDetails? fountansferdetails;

  const CustomCheckBoxTile({
    super.key,
    this.fountansferdetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.graylight,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: CheckboxListTile(
        secondary: Image.asset(AppIcons.logo, width: 100),
        subtitle: Text(
            "${fountansferdetails?.Account_number ?? " "} - ${fountansferdetails?.bank_name ?? " "}"),
        title: Text(
          "${fountansferdetails?.Holder_name ?? ""},",
          style: TextStyles.BlackDefaultBoldText,
        ),
        tileColor: AppColors.graylight,
        checkColor: AppColors.white,
        activeColor: AppColors.green,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0), // Adjust the radius as needed
          ),
        ),
        visualDensity: const VisualDensity(horizontal: 1.0, vertical: 1.0),
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        value: true,
        onChanged: (value) {},
      ),
    );
  }
}
