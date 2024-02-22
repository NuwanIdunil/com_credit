import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/models/foun_tansfer_details.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/cutom_checkboxtile.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/row_spacer.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class TransactionCompleateScreen extends StatefulWidget {
  final FundTransferDetails fundTransferDetails;
  const TransactionCompleateScreen(
    this.fundTransferDetails, {
    super.key,
  });

  @override
  State<TransactionCompleateScreen> createState() =>
      _TransactionCompleateScreenState();
}

class _TransactionCompleateScreenState
    extends State<TransactionCompleateScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.fundTransferDetails.Account_number);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> transactionStatus = {
      'Status': 'Fail',
      'Benificiary Name': widget.fundTransferDetails.Holder_name,
      'Account Number': widget.fundTransferDetails.Account_number,
      'Bank': widget.fundTransferDetails.bank_name,
      'Paid Using': 'Usre account',
      'Remarks': 'Repair Fees',
    };
    bool isSucces = transactionStatus['Status'] == 'Complete' ? true : false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 375 / 350,
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        AppIcons.texture2,
                        width: ScreenUtil.width,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ConstColumnSpacer(1),
                        Container(
                          width: ScreenUtil.width,
                          height: Ui.getPadding(8),
                          color: AppColors.graylight,
                          child: Center(
                            child: Text(
                              isSucces
                                  ? "Transaction Completed !"
                                  : "Transaction Failed !",
                              style: TextStyles.BlackDefaultBoldText.copyWith(
                                  color: isSucces
                                      ? AppColors.darkGreen
                                      : AppColors.red,
                                  fontSize: Ui.getFontSize(1.3)),
                            ),
                          ),
                        ),
                        //ConstColumnSpacer(6),
                        Image.asset(
                          isSucces ? AppIcons.sucess : AppIcons.fail,
                          width: Ui.getPadding(15),
                          // height: Ui.padding2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Ui.padding2),
                          child: CustomCheckBoxTile(
                            fountansferdetails: widget.fundTransferDetails,
                          ),
                        ),
                      ],
                    ),

                    // CustomCheckBoxTile(
                    //   fountansferdetails: widget.fundTransferDetails,
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(4)),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: transactionStatus.length,
                itemBuilder: (context, index) {
                  List<String> keysList = transactionStatus.keys.toList();
                  return Padding(
                    padding: EdgeInsets.only(bottom: Ui.getPadding(2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${keysList[index]}",
                          style: TextStyles.graydefaultTextStyle
                              .copyWith(fontSize: Ui.getFontSize(1.2)),
                        ),
                        Text(
                          "${transactionStatus[keysList[index]]}",
                          style: TextStyles.BlackDefaultText.copyWith(
                            fontSize: Ui.getFontSize(1.2),
                            color: (!isSucces && keysList[index] == 'Status'
                                ? AppColors.red
                                : AppColors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Sharebuttom(context),
                SizedBox(
                  width: Ui.padding,
                ),
                DownloadButton(context),
              ],
            )),
            const ColumnSpacer(3),
            MainButton(
                onpressed: () {
                  pushScreen(context, ScreenRoutes.toPeerToPeerTransferScreen);
                },
                text: "Done"),
            const ColumnSpacer(1.5),
            FooterText(),
            const ColumnSpacer(2),
          ],
        ),
      ),
    );
  }

  Widget Sharebuttom(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Ui.getRadius(1.5)),
      ),
      onTap: () {
        print("Tapped");
      },
      child: Ink(
        width: Ui.getPadding(20),
        height: Ui.getPadding(7),
        decoration: BoxDecoration(
            color: AppColors.graylight,
            borderRadius: BorderRadius.all(Radius.circular(Ui.getRadius(1.5)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Share',
              style: TextStyles.BlackDefaultBoldText,
            ),
            Icon(Icons.share_outlined)
          ],
        ),
      ),
    );
  }

  Widget DownloadButton(BuildContext context) {
    return Material(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Ui.getRadius(1.5)),
        ),
        onTap: () {
          print("Tapped");
        },
        child: Ink(
            width: Ui.getPadding(10),
            height: Ui.getPadding(7),
            decoration: BoxDecoration(
                color: AppColors.graylight,
                borderRadius:
                    BorderRadius.all(Radius.circular(Ui.getRadius(1.5)))),
            child: Center(
              child: Icon(Icons.file_download_outlined),
            )),
      ),
    );
  }
}
