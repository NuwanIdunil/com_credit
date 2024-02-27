import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';

class NewBillerScreen extends StatefulWidget {
  const NewBillerScreen({Key? key}) : super(key: key);

  @override
  State<NewBillerScreen> createState() => _NewBillerScreenState();
}

class _NewBillerScreenState extends State<NewBillerScreen> {
  ValueNotifier<List> ListValueNotifier = ValueNotifier([]);
  List<Map> icon = [
    {"icon": AppIcons.bank, "name": "Finance"},
    {"icon": AppIcons.exchange, "name": "Telepone"},
    {"icon": AppIcons.personal, "name": "Loans"},
    {"icon": AppIcons.bank, "name": "Account"},
    {"icon": AppIcons.exchange, "name": "Pawing"},
    {"icon": AppIcons.personal, "name": "Loans"},
  ];
  List<Map> Finance = [
    {"icon": AppIcons.bank, "name": "Singer"},
    {"icon": AppIcons.exchange, "name": "union"},
    {"icon": AppIcons.personal, "name": "LoLc"},
    {"icon": AppIcons.bank, "name": "ClC"},
    {"icon": AppIcons.exchange, "name": "CDB"},
  ];

  List<Map> Telepone = [
    {"icon": AppIcons.bank, "name": "Dialog"},
    {"icon": AppIcons.exchange, "name": "Mobitel"},
    {"icon": AppIcons.personal, "name": "Hutch"},
    {"icon": AppIcons.bank, "name": "Eteselat"},
    {"icon": AppIcons.exchange, "name": "SLt"},
  ];
  List<Map> _foundUsers = [];
  String dropdownvalue = 'Primary Accounts';

  initState() {
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map> results = [];
    if (enteredKeyword.isEmpty) {
      results = Finance;
    } else {
      results = Finance.where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    _foundUsers = results;
    ListValueNotifier.value = results;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20), // Assuming Ui.getPadding(2) was 20
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstColumnSpacer(4),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: icon.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(children: [
                    // Assuming CircleBox is a widget in your project
                    CircleBox(context, icon, index, () {
                      if (ListValueNotifier.value == Telepone ||
                          ListValueNotifier.value.isEmpty) {
                        ListValueNotifier.value = Finance;
                        _foundUsers = Finance;
                      }
                      if (ListValueNotifier.value == Finance) {
                        ListValueNotifier.value = Telepone;
                        _foundUsers = Telepone;
                      }
                    }),
                  ]),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text("Finance - select your biller",
                style: TextStyles.BlackDefaultBigText.copyWith(
                    fontSize: Ui.getFontSize(1.5))),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.graylight,
                borderRadius:
                    BorderRadius.all(Radius.circular(Ui.getRadius(1)))),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
          ConstColumnSpacer(4),
          Expanded(
            child: ValueListenableBuilder<List>(
              valueListenable: ListValueNotifier,
              builder: (context, value, child) => GridView.extent(
                scrollDirection: Axis.vertical,
                maxCrossAxisExtent: 100.0,
                mainAxisSpacing: 28.0,
                crossAxisSpacing: 8.0,
                padding: EdgeInsets.all(8.0),
                children: _foundUsers.map((item) {
                  return _gridviewelement(item["name"]);
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _gridviewelement(String trxt) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray),
          borderRadius: BorderRadius.all(
              Radius.circular(8))), // Assuming Ui.getRadius(1) was 8
      child: Center(
        child: Text("$trxt"),
      ),
    );
  }
}
