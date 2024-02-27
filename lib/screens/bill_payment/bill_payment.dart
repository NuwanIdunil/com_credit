import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/screens/bill_payment/new_biller_screen.dart';
import 'package:com_credit_mobile/screens/bill_payment/saved_bills.dart';
import 'package:com_credit_mobile/screens/peer_peer_transfer/peer_to_peer_send.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/tab_bar.dart';
import 'package:flutter/material.dart';

class BillPaymentFinance extends StatefulWidget {
  const BillPaymentFinance({super.key});

  @override
  State<BillPaymentFinance> createState() => _BillPaymentFinanceState();
}

class _BillPaymentFinanceState extends State<BillPaymentFinance>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int? index;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        isLeading: true,
        title: 'Bill Payment -Finance',
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            CustomTabBar(
              onChanged: () {
                setState(() {
                  _tabController.index;
                });
              },
              tabController: _tabController,
              tabviewElements: const [
                Tab(
                  text: "New Biller",
                ),
                Tab(
                  text: "Saved Billers",
                ),
                Tab(
                  text: "My Leasings",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                NewBillerScreen(),
                SavedBillsScreen(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
