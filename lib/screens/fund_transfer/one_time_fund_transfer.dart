import 'dart:ffi';

import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/drop_down.menu.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/component/text_field_display.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/utils/decorator_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class OneTimeFundTransferScreen extends StatefulWidget {
  final VoidCallback? movetab;
  const OneTimeFundTransferScreen(this.movetab, {super.key});

  @override
  State<OneTimeFundTransferScreen> createState() =>
      _OneTimeFundTransferScreenState();
}

final _accountNumberController = TextEditingController();
final emailController = TextEditingController();
final mobileController = TextEditingController();
var beneficiary = ['Name1', 'name2 ', 'name3'];
String dropdownvalue = beneficiary[0];
bool isSaveThisbeneficiary = false;

class _OneTimeFundTransferScreenState extends State<OneTimeFundTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InputTextField(
              _accountNumberController,
              hint: "Account Number",
              textCapitalization: TextCapitalization.characters,
            ),
            const ConstColumnSpacer(2),
            InputTextField(
              _accountNumberController,
              hint: "Name",
              textCapitalization: TextCapitalization.characters,
            ),
            const ConstColumnSpacer(2),

            TextFiledDisplay(
              text: "Select beneficiary bank account",
              textStyle: TextStyles.graydefaultTextStyle,
              icon: Icons.arrow_drop_down,
              ontapfiled: () {
                widget.movetab!();
              },
            ),
            // DropdownFormField(
            //     dropdownItems: beneficiary, dropdownvalue: dropdownvalue),
            const ConstColumnSpacer(2),
            InputTextField(
              _accountNumberController,
              hint: "Remarks",
              textCapitalization: TextCapitalization.characters,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                      value: isSaveThisbeneficiary,
                      activeColor: AppColors.green,
                      shape: CircleBorder(),
                      // fillColor: MaterialStatePropertyAll(AppColors.green),
                      checkColor: AppColors.white,
                      side: BorderSide(color: AppColors.gray2),
                      onChanged: (newValue) {
                        setState(() {
                          isSaveThisbeneficiary = newValue!;
                        });
                      }),
                ),
                Text(
                  'Save this beneficiary',
                  style: TextStyles.BlackDefaultText,
                )
              ],
            ),
            InputTextField(
              _accountNumberController,
              hint: "Remarks",
              textCapitalization: TextCapitalization.characters,
            ),
            const ConstColumnSpacer(3),
            MainButton(onpressed: () {}, text: "Next"),
            const ConstColumnSpacer(3),
            const FooterText(),
            const ConstColumnSpacer(2),
          ],
        ),
      ),
    );
  }
}
