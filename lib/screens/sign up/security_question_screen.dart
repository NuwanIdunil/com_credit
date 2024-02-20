import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/drop_down.menu.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/utils/decorator_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SetSecurityQuestionScreen extends StatefulWidget {
  const SetSecurityQuestionScreen({super.key});

  @override
  State<SetSecurityQuestionScreen> createState() =>
      _SetSecurityQuestionScreenState();
}

class _SetSecurityQuestionScreenState extends State<SetSecurityQuestionScreen> {
  final _motherNameController = TextEditingController();
  var dropdownItems = [
    "Question 1",
    "Question 2",
    "Question 3",
    "Question 4",
  ];
  String dropdownvalue = 'Primary Accounts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        // resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          isLeading: true,
          title: "Setup Security Questions",
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ConstColumnSpacer(8),
                InputTextField(
                  _motherNameController,
                  hint: "what is your mother name",
                  enabled: false,
                ),
                const ConstColumnSpacer(2),
                InputTextField(
                  _motherNameController,
                  hint: "start Typing",
                  enabled: true,
                ),
                const ConstColumnSpacer(5),
                DropdownFormField(
                  dropdownItems: dropdownItems,
                  dropdownvalue: dropdownvalue,
                ),
                const ConstColumnSpacer(2),
                DropdownFormField(
                  dropdownItems: dropdownItems,
                  dropdownvalue: dropdownvalue,
                ),
                const ConstColumnSpacer(10),
                Center(
                  child: MainButton(
                    onpressed: () {},
                    text: "Save & Continue",
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
