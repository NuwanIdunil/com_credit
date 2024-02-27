import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/models/foun_tansfer_details.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/bill_payment/saved_bills.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/bottom_sheet.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/component/tab_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/text_field_display.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'new_biller_screen.dart';

class ShedulerPaymentSheet {
  final BuildContext context;
  // final String accountNumber;
  // final String bankName;
  // final String userName;
  ShedulerPaymentSheet({
    required this.context,
    // required this.accountNumber,
    // required this.bankName,
    // required this.userName,
  });
  late TabController _tabController;
  late FundTransferDetails fundTransferDetails;
  opensheet() {
    showModalBottomSheet(
      //backgroundColor: Colors.transparent,
      isDismissible: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Ui.getRadius(5)), // Adjust the value as needed
        ),
      ),
      context: context,
      builder: (context) => Container(
        height: ScreenUtil.height * 0.8,
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(
              title: "Select Schedule Payment Method",
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    ConstColumnSpacer(2),
                    Container(
                      color: AppColors.graylight,
                      child: TabBar(
                          indicator: BoxDecoration(
                            color: AppColors.red,
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelStyle: TextStyles.BlackSmallBoldText,
                          labelStyle: TextStyles.whiteBoldText,
                          tabs: const [
                            Tab(
                              text: "One Time Schedule",
                            ),
                            Tab(
                              text: "Recurring Payment",
                            ),
                          ]),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          oneTimeShedule(),
                          recurringPayment(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget oneTimeShedule() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
    child: SfDateRangePicker(
      selectionColor: AppColors.red,
    ),
  );
}

Widget recurringPayment() {
  DateRangePickerController _datecontroller = DateRangePickerController();
  DateTime selectedDate = DateTime.now();
  int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[month - 1];
  }

  var n = DateTime.now();

  int selectedValue = n.day;
  int numberOfdays = getDaysInMonth(n.year, n.month);
  print("$numberOfdays");
  print(DateTime(n.year, n.month - 7, 1));
//int numberofdate =getDaysInMonth(int year, int month);
  return StatefulBuilder(
    builder: (context, setState) => Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SfDateRangePicker(
              controller: _datecontroller,
              selectionColor: AppColors.red,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                setState(
                  () {
                    n = args.value;
                    selectedValue = n.day;
                  },
                );
                n = args.value;
              },
            ),
            ConstColumnSpacer(2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2.0)),
              child: Text(
                "Set payment processing date of each month",
                style: TextStyles.BlackDefaultText,
                textAlign: TextAlign.center,
              ),
            ),
            ConstColumnSpacer(3),
            Container(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 80,
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(Ui.getRadius(2))),
                    child: Center(
                      child: DropdownButton<int>(
                        iconEnabledColor: AppColors.white,
                        dropdownColor: AppColors.gray,
                        style: TextStyles.BlackDefaultText.copyWith(
                            fontSize: Ui.getFontSize(1.5),
                            color: AppColors.white),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                            DateTime? currentDate =
                                _datecontroller.selectedDate;

                            int dayFromValue = value;

                            DateTime newDate = DateTime.now().subtract(Duration(
                                days: currentDate!.day - dayFromValue));

                            _datecontroller.selectedDate = DateTime(
                                currentDate.year,
                                currentDate.month,
                                newDate.day,
                                newDate.hour,
                                newDate.minute,
                                newDate.second);
                            numberOfdays = getDaysInMonth(
                                currentDate.year, currentDate.month);
                            print(_datecontroller.selectedDate);
                          });
                        },
                        items: List.generate(
                          numberOfdays, // Adjust the range according to your needs
                          (index) => DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text(
                                '${index + 1}'), // Display numbers in the dropdown
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Date",
                    style: TextStyles.BlackDefaultText,
                  )
                ],
              ),
            ),
            ConstColumnSpacer(3),
            MainButton(onpressed: () {}, text: "Create Schedule"),
            ConstColumnSpacer(5),
          ],
        ),
      ),
    ),
  );
}
