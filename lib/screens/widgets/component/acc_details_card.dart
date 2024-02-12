import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class AccDetailsCardLayerOut extends StatefulWidget {
  AccDetailsCardLayerOut({super.key});

  @override
  State<AccDetailsCardLayerOut> createState() => _AccDetailsCardLayerOutState();
}

class _AccDetailsCardLayerOutState extends State<AccDetailsCardLayerOut> {
  var dropdownItems = [
    "Primary Accounts",
    "Savings Account",
    "Credit Card",
    "Other Accounts",
  ];
  String dropdownvalue = 'Primary Accounts';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
         // color: AppColors.red,
          image: DecorationImage(image: AssetImage(AppIcons.cardBackground),fit: BoxFit.contain)
        ),
        //height: Ui.getPadding(times),
        width: double.infinity,
        child: Column(
          children: [
            ConstColumnSpacer(1.5),
            Text(
              "Experience the ease of make payments \n and transactions !",
              style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: Ui.getFontSize(1)),
              textAlign: TextAlign.center,
            ),
            ConstColumnSpacer(3),
            RichText(
              text: TextSpan(
                  text: 'Your Balance ',
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Ui.getFontSize(1.4)),
                  children: <TextSpan>[
                    TextSpan(
                      text: '(LKR)',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Ui.getFontSize(1),
                      ),
                    )
                  ]),
            ),
           ConstColumnSpacer(0.5),
            RichText(
              text: TextSpan(
                  text: 'LKR ',
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Ui.getFontSize(1.3)),
                  children: <TextSpan>[
                    TextSpan(
                      text: '250,0000',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Ui.getFontSize(2.5),
                      ),
                    ),
                    TextSpan(
                      text: '.00',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Ui.getFontSize(1.5),
                      ),
                    )
                  ]),
            ),
           ConstColumnSpacer(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "**** 4657 | Primary Account",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: Ui.getFontSize(0.8),
                  ),
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color:
                        AppColors.black.withOpacity(0.4), // Set your desired background color here
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left :5.0),
                    child: DropdownButton(
                      underline: Container(),
                      iconEnabledColor: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownvalue,
                      dropdownColor: AppColors.gray,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: Ui.getFontSize(0.8),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: dropdownItems.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            dropdownvalue = newValue;
                          });
                        }
                      },
                    ),
                  ),
                  
                ),
              ],
            ),
          ColumnSpacer(0.5),
          ],
        ));
  }
}
