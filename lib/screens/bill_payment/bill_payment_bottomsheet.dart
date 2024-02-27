import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/models/foun_tansfer_details.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/bottom_sheet.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/component/text_field_display.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetAmountToBillPaySheet {
  final BuildContext context;
  // final String accountNumber;
  // final String bankName;
  // final String userName;
  SetAmountToBillPaySheet({
    required this.context,
    // required this.accountNumber,
    // required this.bankName,
    // required this.userName,
  });
  TextEditingController _accountNumberController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  TextEditingController _nickNameController = TextEditingController();
  bool isSaveThisbeneficiary = false;

  late FundTransferDetails fundTransferDetails;
  opensheet() {
    // fundTransferDetails = FundTransferDetails(
    //     Account_number: accountNumber,
    //     Holder_name: userName,
    //     bank_name: bankName);
    showBottomSheetModal(
      context,
      // sheetHeight: ScreenUtil.height * 0.85,
      isviewInsets: false,
      isDraggable: true,
      children: [
        StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
                child: Column(
                  children: [
                    const CustomAppBar(
                      isLeading: true,
                      title: "Set amount to Pay",
                      iscolorApply: false,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenUtil.width * 0.5,
                          child: TextFormField(
                            autofocus: true,
                            cursorRadius: Radius.circular(10),
                            style: TextStyles.blackBigBoldText
                                .copyWith(fontSize: Ui.getFontSize(2)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefix: RichText(
                                text: TextSpan(
                                  style:
                                      TextStyles.BlackDefaultBoldText.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Ui.getFontSize(1.5)),
                                  children: [
                                    TextSpan(
                                        text: 'LKR',
                                        style: TextStyles.grayTextStylebig
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Ui.getFontSize(1.5))),
                                    const TextSpan(
                                      text: ' ',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [CurrencyFormatter()],
                          ),
                        ),
                      ],
                    ),
                    const ConstColumnSpacer(2),
                    Column(
                      children: [
                        InputTextField(_accountNumberController,
                            hint: "Account Number"),
                        const ConstColumnSpacer(2),
                        InputTextField(_remarkController, hint: "Remark"),
                        const ConstColumnSpacer(2),
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
                        const ConstColumnSpacer(1),
                        InputTextField(_nickNameController, hint: "Nick Name"),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Ui.getPadding(2.0)),
                      child: Text(
                        "Review your transaction details and proceed\n to next step",
                        style: TextStyles.BlackDefaultText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ConstColumnSpacer(3),
                    Center(
                      child: MainButton(
                          //FundTransferDetails fundTransferDetails();
                          onpressed: () {
                            fundTransferDetails = FundTransferDetails(
                                Account_number: _accountNumberController.text,
                                Holder_name: _remarkController.text,
                                bank_name: _nickNameController.text);
                            pushScreen(context,
                                ScreenRoutes.toPaymentConformationScreen,
                                arguments: fundTransferDetails);
                          },
                          text: "Next"),
                    ),

                    ConstColumnSpacer(4),
                    FooterText(),
                    ConstColumnSpacer(4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove any non-digit characters from the new value
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Add commas after every three digits from the end
    final RegExp regex = RegExp(r'(\d{3})(?=\d)');
    newText = newText.replaceAllMapped(regex, (Match match) => '${match[1]},');

    // Add the currency symbol and set the selection
    final String formattedText = newText;
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
