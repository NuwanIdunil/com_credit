import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);
  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: TabbarList.length, vsync: this);
  }

  List<String> TabbarList = [
    "All",
    "Send Money",
    "Bill Payment",
    "Mobile Crad"
  ];
  ValueNotifier valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar(
          title: "Transaction  History",
        ),
        body: Padding(
          padding: EdgeInsets.only(top: Ui.getPadding(1.5)),
          child: DefaultTabController(
            length: TabbarList.length,
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, value, child) => TabBar(
                    controller: tabController,
                    onTap: (value) {
                      valueNotifier.value = tabController.index;
                    },
                    unselectedLabelStyle: TextStyles.BlackSmallBoldText,
                    labelStyle: TextStyles.whiteBoldText,
                    isScrollable: true,
                    dividerHeight: 0,
                    indicatorColor: AppColors.white,
                    splashFactory: InkSplash.splashFactory,
                    splashBorderRadius:
                        BorderRadius.all(Radius.circular(Ui.getRadius(100))),
                    tabs: TabbarList.map((e) {
                      int index = TabbarList.indexOf(e);
                      return Tab(
                        child: Container(
                          height: ScreenUtil.height * 0.05,
                          padding: EdgeInsets.symmetric(
                              horizontal: e == "All"
                                  ? Ui.getPadding(5)
                                  : Ui.getPadding(3)),
                          decoration: BoxDecoration(
                            color: index == tabController.index
                                ? AppColors.red
                                : AppColors.graylight,
                            borderRadius:
                                BorderRadius.circular(Ui.getRadius(1.5)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("$e"),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    fillColor: AppColors.graylight,
                    filled: true,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListView.separated(
                        padding: EdgeInsets.all(15),
                        itemCount: 20,
                        separatorBuilder: (BuildContext context, int index) =>
                            ConstColumnSpacer(1),
                        itemBuilder: (context, index) {
                          return _transactionHistory();
                        },
                      ),
                      ListView.separated(
                        padding: EdgeInsets.all(15),
                        itemCount: 20,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {},
                            title: Text("Status List $index"),
                            subtitle: Text("Tab bar ui"),
                            trailing: Icon(Icons.arrow_circle_right_sharp),
                          );
                        },
                      ),
                      ListView.separated(
                        padding: EdgeInsets.all(15),
                        itemCount: 20,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {},
                            title: Text("Call List $index"),
                            subtitle: Text("Tab bar ui"),
                            trailing: Icon(Icons.arrow_circle_right_sharp),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _runFilter(
      String enteredKeyword, List<Map> DataList, ValueNotifier valueNotifier) {
    List<Map> results = [];
    if (enteredKeyword.isEmpty) {
      results = DataList;
    } else {
      results = DataList.where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    valueNotifier.value = results;
  }

  Widget _transactionHistory() {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.graylight,
            borderRadius: BorderRadius.all(Radius.circular(Ui.getRadius(2)))),
        height: ScreenUtil.height * 0.13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppIcons.logo,
              height: Ui.getPadding(5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chamara Ratnayake",
                  style: TextStyles.BlackSmallBoldText,
                ),
                Text("Mar 27,2022at 09.32pm",
                    style: TextStyles.graydefaultTextStyle),
              ],
            ),
            Text("LKR 499,000.00", style: TextStyles.BlackSmallBoldText),
          ],
        ));
  }
}
