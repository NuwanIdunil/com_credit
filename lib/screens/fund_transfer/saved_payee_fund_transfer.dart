import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/screens/fund_transfer/set_amount_toPay_bottomsheet.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class SavedPayeeFounTransfer extends StatefulWidget {
  const SavedPayeeFounTransfer({super.key});

  @override
  State<SavedPayeeFounTransfer> createState() => _SavedPayeeFounTransferState();
}

class _SavedPayeeFounTransferState extends State<SavedPayeeFounTransfer> {
  List<Map<dynamic, String>> beneficiary = [
    {
      "logo": AppIcons.logo,
      "bank_name": "pepoles bank ",
      "Account_number": "01255587",
      "Holder_name": "Sadun tharaka"
    },
    {
      "logo": AppIcons.logo,
      "bank_name": "Commercial  ",
      "Account_number": "3773783",
      "Holder_name": "Nuwan idunil"
    },
    {
      "logo": AppIcons.logo,
      "bank_name": "Boc ",
      "Account_number": "575785",
      "Holder_name": "kasun disage"
    },
    {
      "logo": AppIcons.logo,
      "bank_name": "NDB",
      "Account_number": "0458777",
      "Holder_name": "Buddi LAkshan"
    },
    {
      "logo": AppIcons.logo,
      "bank_name": "HNB ",
      "Account_number": "3833737",
      "Holder_name": "Nuwan idunil"
    },
    {
      "logo": AppIcons.logo,
      "bank_name": "RDB",
      "Account_number": "7373737",
      "Holder_name": "anura santha"
    },
    {
      "logo": AppIcons.logo,
      "bank_name": "NDB ",
      "Account_number": "35078387",
      "Holder_name": "dananjaya yalalath"
    },
    {
      "logo": AppIcons.logo,
      "bank_name": "pepoles bank ",
      "Account_number": "8584888",
      "Holder_name": "shalinda pasidu"
    },
    {
      "logo": AppIcons.logo,
      "bank_name": "Boc ",
      "Account_number": "01255587",
      "Holder_name": "dasun shanka",
    },
  ];
  late int _selectedValue = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
            child: ListView.builder(
              addRepaintBoundaries: true,
              itemCount: beneficiary.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: Ui.getPadding(1)),
                  child: CheckboxListTile(
                    secondary:
                        Image.asset(AppIcons.logo, width: Ui.getPadding(12)),
                    subtitle: Text(
                      '${beneficiary[index]["Account_number"]}-${beneficiary[index]["bank_name"]} ',
                    ),
                    title: Text(
                      '${beneficiary[index]["Holder_name"]}',
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
                    visualDensity:
                        const VisualDensity(horizontal: 2.0, vertical: 4.0),
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    value: _selectedValue == index,
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          _selectedValue = index;
                        } else {
                          _selectedValue = -1;
                        }
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Container(
            color: AppColors.white,
            width: ScreenUtil.width,
            child: Padding(
                padding: EdgeInsets.only(top: Ui.getPadding(1)),
                child: Column(
                  children: [
                    MainButton(
                        onpressed: () {
                          SetAmountToPaySheet(
                                  context: context,
                                  accountNumber: beneficiary[_selectedValue]
                                      ["Account_number"]!,
                                  bankName: beneficiary[_selectedValue]
                                      ["bank_name"]!,
                                  userName: beneficiary[_selectedValue]
                                      ["Holder_name"]!)
                              .opensheet();
                        },
                        text: "next"),
                    ConstColumnSpacer(1.5),
                    FooterText(),
                    ConstColumnSpacer(1),
                  ],
                )))
      ],
    );
  }
}
