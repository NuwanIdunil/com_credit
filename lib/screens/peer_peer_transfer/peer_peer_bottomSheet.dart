import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/models/foun_tansfer_details.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/bottom_sheet.dart';
import 'package:com_credit_mobile/screens/widgets/component/cutom_checkboxtile.dart';
import 'package:com_credit_mobile/screens/widgets/component/drop_down.menu.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/component/text_field_display.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class PeerToPerrBottomSheet {
  final fundTransferDetails = FundTransferDetails(
      Account_number: "2275478533",
      Holder_name: "Kasun Rajitha",
      bank_name: "BOC");

  final BuildContext context;
  bool ismanualtranfer = false;
  bool iscoformation = false;
  final _accountNumbercontraller = TextEditingController();
  final _paymentcontraller = TextEditingController();
  final _remarkcontraller = TextEditingController();
  var dropdownItems = [
    "Primary Accounts",
    "Savings Account",
    "Credit Card",
    "Other Accounts",
  ];
  String dropdownvalue = 'Primary Accounts';
  PeerToPerrBottomSheet({
    required this.context,
    required this.ismanualtranfer,
    required this.iscoformation,
  });

  opensheet() {
    showBottomSheetModal(context,
        //isDraggable: true,
        children: ismanualtranfer
            ? _manualTransfer(context)
            : iscoformation
                ? _confomation(context)
                : _usingQrTransfer(context));
  }

  List<Widget> _manualTransfer(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ConstColumnSpacer(2),
            const CustomAppBar(
              isLeading: true,
              title: "Peer to Peer Transfer",
            ),
            const ConstColumnSpacer(3),
            Text("Select Your Account ", style: TextStyles.BlackDefaultText),
            DropdownFormField(
                dropdownItems: dropdownItems, dropdownvalue: dropdownvalue),
            const ConstColumnSpacer(3),
            Text("Enter Receiver Account Number",
                style: TextStyles.BlackDefaultText),
            InputTextField(_accountNumbercontraller),
            const ConstColumnSpacer(3),
            Text("Enter Payment amount", style: TextStyles.BlackDefaultText),
            InputTextField(_accountNumbercontraller),
            const ConstColumnSpacer(3),
            Text("Enter Remark", style: TextStyles.BlackDefaultText),
            InputTextField(_accountNumbercontraller),
            const ConstColumnSpacer(3),
            Center(
              child: MainButton(
                  onpressed: () {
                    Navigator.of(context).pop();
                    PeerToPerrBottomSheet(
                            context: context,
                            ismanualtranfer: false,
                            iscoformation: true)
                        .opensheet();

                    ;
                  },
                  text: "Next"),
            ),
            const ConstColumnSpacer(3.9),
          ],
        ),
      )
    ];
  }

  List<Widget> _usingQrTransfer(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ConstColumnSpacer(4),
            const CustomAppBar(
              isLeading: true,
              title: "Peer to Peer Transfer",
            ),
            const ConstColumnSpacer(2),
            Text("Select Your Account ", style: TextStyles.BlackDefaultText),
            DropdownFormField(
                dropdownItems: dropdownItems, dropdownvalue: dropdownvalue),
            const ConstColumnSpacer(2),
            const TextFiledDisplay(
              text: "to",
              endtext: "Nuwan kumara 6325435743",
            ),
            const ConstColumnSpacer(3),
            Text("Enter Payment amount", style: TextStyles.BlackDefaultText),
            InputTextField(_accountNumbercontraller),
            const ConstColumnSpacer(3),
            Text("Enter Remark", style: TextStyles.BlackDefaultText),
            InputTextField(_accountNumbercontraller),
            const ConstColumnSpacer(3),
            Center(
              child: MainButton(
                  onpressed: () {
                    PeerToPerrBottomSheet(
                            context: context,
                            ismanualtranfer: false,
                            iscoformation: true)
                        .opensheet()
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  text: "Next"),
            ),
            const ConstColumnSpacer(5),
          ],
        ),
      )
    ];
  }

  List<Widget> _confomation(BuildContext context) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ConstColumnSpacer(2),
          const CustomAppBar(
            isLeading: true,
            title: "Peer to Peer Transfer",
          ),
          const ConstColumnSpacer(2),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
              child: Text(
                "Make your payments secure and fast \n using commercial credit",
                style: TextStyles.BlackDefaultText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const ConstColumnSpacer(5),
          TextFiledDisplay(
            text: "To",
            endtext: "Qrvalue",
            textStyle: TextStyles.graydefaultTextStyle
                .copyWith(fontSize: Ui.getFontSize(1.2)),
          ),
          const ConstColumnSpacer(2),
          CustomCheckBoxTile(
            fountansferdetails: fundTransferDetails,
          ),
          const ConstColumnSpacer(2),
          Center(
            child: Text(
              "Payment Amount",
              style: TextStyles.blackBigBoldText,
            ),
          ),
          const ConstColumnSpacer(3),
          const TextFiledDisplay(
            text: "January Payment",
          ),
          const ConstColumnSpacer(5),
          Center(
            child: MainButton(
                onpressed: () {
                  pushScreen(context, ScreenRoutes.toTransactionCompleateScreen,
                      arguments: fundTransferDetails);
                },
                text: "Confirm And Pay"),
          ),
          const ConstColumnSpacer(5),
        ],
      )
    ];
  }
}
