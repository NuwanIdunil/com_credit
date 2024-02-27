import 'dart:async';

import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/screens/fund_transfer/one_time_fund_transfer.dart';
import 'package:com_credit_mobile/screens/fund_transfer/saved_payee_fund_transfer.dart';
import 'package:com_credit_mobile/screens/peer_peer_transfer/peer_to_peer_recive.dart';
import 'package:com_credit_mobile/screens/peer_peer_transfer/peer_to_peer_send.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/tab_bar.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class PeerToPeerTransferScreen extends StatefulWidget {
  const PeerToPeerTransferScreen({Key? key}) : super(key: key);

  @override
  State<PeerToPeerTransferScreen> createState() =>
      _PeerToPeerTransferScreenState();
}

class _PeerToPeerTransferScreenState extends State<PeerToPeerTransferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int? index;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(
          isLeading: true,
          title: 'Peer to Peer Transfer',
        ),
        body: Container(
          color: AppColors.white,
          child: Column(
            children: [
              //ConstColumnSpacer(2),

              CustomTabBar(
                onChanged: () {
                  setState(() {
                    _tabController.index;
                  });
                },
                tabController: _tabController,
                tabviewElements: const [
                  Tab(
                    text: "Send",
                  ),
                  Tab(
                    text: "Receive",
                  ),
                ],
              ),
              const ConstColumnSpacer(3),

              Padding(
                padding: EdgeInsets.fromLTRB(Ui.getPadding(4.0), 0,
                    Ui.getPadding(4.0), Ui.getPadding(2.0)),
                child: Text(
                  _tabController.index == 0
                      ? "Please scan QR for fill details to perform\n your transaction. "
                      : "Please select your account for \n Generate your QR",
                  style: TextStyles.BlackDefaultText,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: const [
                  PeerToPeerSend(),
                  PeerToPeerReciveScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
