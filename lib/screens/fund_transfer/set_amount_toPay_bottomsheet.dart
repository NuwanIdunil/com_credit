import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/models/foun_tansfer_details.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/bottom_sheet.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/component/text_field_display.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class SetAmountToPaySheet {
  final BuildContext context;
  final String accountNumber;
  final String bankName;
  final String userName;
  SetAmountToPaySheet({
    required this.context,
    required this.accountNumber,
    required this.bankName,
    required this.userName,
  });
  late FundTransferDetails fundTransferDetails;
  opensheet() {
    fundTransferDetails = FundTransferDetails(
        Account_number: accountNumber,
        Holder_name: userName,
        bank_name: bankName);
    showBottomSheetModal(
      context,
      // sheetHeight: ScreenUtil.height * 0.85,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
              child: Column(
                children: [
                  const CustomAppBar(
                    isLeading: true,
                    title: "Set amount to Pay",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Ui.getPadding(4.0)),
                    child: Text(
                      "Make your payments secure and fast\n using Commercial Credit",
                      style: TextStyles.BlackDefaultText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const ConstColumnSpacer(2),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'LKR ',
                        style: TextStyles.grayTextStylebig.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: Ui.getFontSize(2)),
                        children: <TextSpan>[
                          TextSpan(
                              text: '250000',
                              style: TextStyles.blackBigBoldText
                                  .copyWith(fontSize: Ui.getFontSize(3))),
                          TextSpan(
                              text: '. 00',
                              style: TextStyles.blackBigBoldText
                                  .copyWith(fontSize: Ui.getFontSize(2))),
                        ],
                      ),
                    ),
                  ),
                  const ConstColumnSpacer(2),
                  Column(
                    children: [
                      TextFiledDisplay(
                        text: accountNumber,
                        ontapfiled: () {
                          Navigator.pop(context);
                        },
                      ),
                      const ConstColumnSpacer(1),
                      TextFiledDisplay(
                        text: userName,
                        ontapfiled: () {
                          Navigator.pop(context);
                        },
                      ),
                      const ConstColumnSpacer(1),
                      TextFiledDisplay(
                        text: bankName,
                        ontapfiled: () {
                          Navigator.pop(context);
                        },
                      ),
                      const ConstColumnSpacer(1),
                      TextFiledDisplay(
                        text: "rapir Free",
                        ontapfiled: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const ConstColumnSpacer(3),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(4.0)),
                  //   child: Text(
                  //     "Review your transaction details and proceed \n to next step",
                  //     style: TextStyles.BlackDefaultText,
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  ConstColumnSpacer(3),
                  Center(
                    child: MainButton(
                        onpressed: () {
                          pushScreen(
                              context, ScreenRoutes.toPaymentConformationScreen,
                              arguments: fundTransferDetails);
                        },
                        text: "Next"),
                  ),
                  ConstColumnSpacer(3),
                  FooterText(),
                  ConstColumnSpacer(3),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
