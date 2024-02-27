import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/screens/widgets/bell_icon.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/acc_details_card.dart';
import 'package:com_credit_mobile/screens/widgets/component/bottom_navigation_bar.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/row_spacer.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map> icon = [
    {"icon": AppIcons.bank, "name": "Account"},
    {"icon": AppIcons.exchange, "name": "Pawing"},
    {"icon": AppIcons.personal, "name": "Loans"},
    {"icon": AppIcons.bank, "name": "Account"},
    {"icon": AppIcons.exchange, "name": "Pawing"},
    {"icon": AppIcons.personal, "name": "Loans"},
  ];

  List icon1 = [
    AppIcons.pay_bills,
    AppIcons.fund_transaction,
    AppIcons.Message,
    AppIcons.limitation
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            Ui.getPadding(1), ScreenUtil.height * 0.02, Ui.getPadding(1), 0),
        child: Column(
          children: [
            const ConstColumnSpacer(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Image.asset(AppIcons.logo,
                      height: ScreenUtil.height * 0.07),
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Good morning",
                            style: TextStyles.BlackDefaultText),
                        Text(
                          "Gayan Sadaruwan",
                          style: TextStyles.BlackSmallBoldText,
                        ),
                      ],
                    ),
                    SizedBox(width: Ui.getPadding(2)),
                    BellIcon(onTap: () {}),
                  ],
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ConstColumnSpacer(2),
                    AccDetailsCardLayerOut(),
                    ConstColumnSpacer(2),
                    Container(
                      height: Ui.getPadding(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.graylight,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (index) {
                            return Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(
                                    5.0), // Adjust padding as needed
                                child: SqareBox(context, icon1, index),
                              ),
                            );
                          })
                          // Add Spacer to distribute remaining space
                          ),
                    ),
                    ConstColumnSpacer(2),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Commercial Credit Services",
                          style: TextStyles.BlackDefaultBoldText),
                    ),
                    ConstColumnSpacer(2),
                    Container(
                      height: Ui.getPadding(18),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: icon.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  CircleBox(context, icon, index, () {}),
                                  ColumnSpacer(0.8),
                                  Text(
                                    icon[index]["name"],
                                    style: TextStyles.versionText,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                    Column(
                      children: [
                        //ConstColumnSpacer(1),
                        TextureContainer(context, "MQBQA1664659795",
                            "vehicle leasing", "250.000"),
                        ConstColumnSpacer(2),
                        TextureContainer(context, "MQBQA1664659795",
                            "vehicle leasing", "250.000"),
                        ConstColumnSpacer(20),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationView(),
      floatingActionButton: Transform.translate(
        offset: Offset(0.0, -10),
        child: SizedBox(
          height: 85,
          width: 85,
          child: FloatingActionButton(
            backgroundColor: AppColors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            child: Image.asset(
              AppIcons.logo,
              height: 40,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget SqareBox(BuildContext contex, List icon, int index) {
  return Material(
    child: InkWell(
      child: Container(
        width: Ui.getPadding(10),
        height: Ui.getPadding(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.white,
        ),
        child: Center(
          child: Image.asset(
            icon[index],
            height: Ui.getPadding(6),
          ),
        ),
      ),
    ),
  );
}

Widget CircleBox(
    BuildContext contex, List<Map> icon, int index, VoidCallback onPressed) {
  return Center(
    child: InkWell(
      borderRadius: BorderRadius.circular(Ui.getRadius(10)),
      onTap: () {
        onPressed();
      },
      child: Ink(
        width: Ui.getPadding(10),
        height: Ui.getPadding(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.graylight.withOpacity(0.3),
            boxShadow: [
              BoxShadow(
                  color: AppColors.graylight.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2),
            ]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  icon[index]["icon"],
                  height: Ui.getPadding(6),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget TextureContainer(BuildContext, String Id, String type, String Amount) {
  return Container(
      padding: EdgeInsets.all(10),
      height: Ui.getPadding(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(
                0, 4), // Offset for the y-axis to create a shadow at the bottom
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
            image: AssetImage(
              AppIcons.texture,
            ),
            fit: BoxFit.fill),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$Id"),
                  Text("$type"),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$Amount",
                    style: TextStyles.BlackSmallSemiBold,
                  ),
                  Text("Current Oustanding"),
                ],
              )
            ],
          ),
        ],
      ));
}
