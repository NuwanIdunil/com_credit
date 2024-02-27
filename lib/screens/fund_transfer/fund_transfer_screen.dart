import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/screens/fund_transfer/one_time_fund_transfer.dart';
import 'package:com_credit_mobile/screens/fund_transfer/saved_payee_fund_transfer.dart';
import 'package:com_credit_mobile/screens/sign%20up/sign_up_personal_details_screen.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/tab_bar.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class FundTransferScreen extends StatefulWidget {
  const FundTransferScreen({super.key});

  @override
  State<FundTransferScreen> createState() => _FundTransferScreenState();
}

class _FundTransferScreenState extends State<FundTransferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Fund Transfer',
        isLeading: true,
        IsShowtabBar: true,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.white,
            width: ScreenUtil.width,
            child: Column(
              children: [
                //ConstColumnSpacer(2),
                CustomTabBar(
                  tabController: _tabController,
                  tabviewElements: const [
                    Tab(
                      text: "One Time",
                    ),
                    Tab(
                      text: "Saved  Payees",
                    ),
                  ],
                ),
                const ConstColumnSpacer(3),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Ui.getPadding(4.0)),
                    child: Text(
                      "Please enter your beneficiary details to perform \n your transaction. ",
                      style: TextStyles.BlackDefaultText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ConstColumnSpacer(3),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              OneTimeFundTransferScreen(() {
                _tabController.animateTo(1);
              }),
              SavedPayeeFounTransfer(),
            ]),
          )
        ],
      ),
    );
  }
}
