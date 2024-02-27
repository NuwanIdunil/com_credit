import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/screens/bill_payment/bill_payment_bottomsheet.dart';
import 'package:com_credit_mobile/screens/fund_transfer/set_amount_toPay_bottomsheet.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class SavedBillsScreen extends StatefulWidget {
  const SavedBillsScreen({super.key});

  @override
  State<SavedBillsScreen> createState() => _SavedBillsScreenState();
}

class _SavedBillsScreenState extends State<SavedBillsScreen> {
  ValueNotifier<List> ListValueNotifier = ValueNotifier([]);
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
  initState() {
    ListValueNotifier.value = beneficiary;
    super.initState();
  }

  late int _selectedValue = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
            child: Column(
              children: [
                ConstColumnSpacer(2),
                Text(
                  "Make your payments secure and fast \n using commercial credit",
                  style: TextStyles.BlackDefaultText,
                  textAlign: TextAlign.center,
                ),
                ConstColumnSpacer(2),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.graylight,
                      borderRadius:
                          BorderRadius.all(Radius.circular(Ui.getRadius(1)))),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ConstColumnSpacer(2),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
            child: ValueListenableBuilder(
              valueListenable: ListValueNotifier,
              builder: (context, value, child) => ListView.builder(
                addRepaintBoundaries: true,
                itemCount: ListValueNotifier.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: Ui.getPadding(1)),
                    child: CheckboxListTile(
                      secondary:
                          Image.asset(AppIcons.logo, width: Ui.getPadding(12)),
                      subtitle: Text(
                        '${ListValueNotifier.value[index]["Account_number"]}-${ListValueNotifier.value[index]["bank_name"]} ',
                      ),
                      title: Text(
                        '${ListValueNotifier.value[index]["Holder_name"]}',
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
                          SetAmountToBillPaySheet(context: context).opensheet();
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

  void _runFilter(String enteredKeyword) {
    List<Map> results = [];
    if (enteredKeyword.isEmpty) {
      results = beneficiary;
    } else {
      results = beneficiary
          .where((user) => user["Holder_name"]!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    ListValueNotifier.value = results;
  }
}
