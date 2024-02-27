import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/models/foun_tansfer_details.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/bill_payment/shedule_payment_bottomsheet.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/bank_account_card.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class PaymentConformationScreen extends StatefulWidget {
  final FundTransferDetails fundTransferDetails;
  const PaymentConformationScreen(this.fundTransferDetails, {super.key});

  @override
  State<PaymentConformationScreen> createState() =>
      _PaymentConformationScreenState();
}

class _PaymentConformationScreenState extends State<PaymentConformationScreen> {
  List<Map> myAccounts = [
    {
      "logo": AppIcons.bocLogo,
      "bank_name": " BOC ",
      "Account_number": "01255587",
      "Holder_name": "Sadun tharaka"
    },
    {
      "logo": AppIcons.peoplesLogo,
      "bank_name": "pepoles bank  ",
      "Account_number": "3773783",
      "Holder_name": "Nuwan idunil"
    },
    {
      "logo": AppIcons.bocLogo,
      "bank_name": "BOC ",
      "Account_number": "575785",
      "Holder_name": "kasun disage"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(isLeading: true, title: "Payment Confirmation"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstColumnSpacer(2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
              child: Center(
                child: Text(
                  "Select Payment Source",
                  style: TextStyles.BlackDefaultText.copyWith(
                    fontSize: Ui.getFontSize(1.3),
                  ),
                ),
              ),
            ),
            ConstColumnSpacer(2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(4.0)),
              child: Text(
                "Make your payments secure and fast\n using Commercial Credit",
                style: TextStyles.BlackDefaultText,
                textAlign: TextAlign.center,
              ),
            ),
            ConstColumnSpacer(3),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Ui.getPadding(2),
              ),
              child: CheckboxListTile(
                secondary: Image.asset(AppIcons.logo, width: 100),
                subtitle: Text(
                    "${widget.fundTransferDetails.Account_number} - ${widget.fundTransferDetails.bank_name}"),
                title: Text(
                  "${widget.fundTransferDetails.Holder_name},",
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
                value: true,
                onChanged: (value) {},
              ),
            ),
            ConstColumnSpacer(2),
            Text(
              "Payment Amount : 12,500 LKR",
              style: TextStyles.BlackDefaultBoldText,
            ),
            ConstColumnSpacer(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month_outlined),
                InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: Text(
                    "Create schedule payment on this biller",
                    style: TextStyles.BlackDefaultText.copyWith(
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            ConstColumnSpacer(2),
            Center(
              child: Text(
                "Select Payment Method",
                style: TextStyles.BlackDefaultText.copyWith(
                  fontSize: Ui.getFontSize(1.3),
                ),
              ),
            ),
            ConstColumnSpacer(2),
            Container(
              height: Ui.getPadding(20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myAccounts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(1)),
                    child: BankAccountCard(
                      accountNumber: myAccounts[index]["Account_number"],
                      bank: myAccounts[index]['bank_name'],
                      icon: myAccounts[index]['logo'],
                    ),
                  );
                },
              ),
            ),
            ConstColumnSpacer(2),
            Text(
              "Your finance payment information's as above.Please confirm \n details and proceed to payment.",
              style: TextStyles.versionText.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            ConstColumnSpacer(4),
            MainButton(
                onpressed: () {
                  ShedulerPaymentSheet(context: context).opensheet();
                },
                text: "Confirm and Pay"),
            ConstColumnSpacer(4),
            FooterText(),
            ConstColumnSpacer(4),
          ],
        ),
      ),
    );
  }
}
