import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class SetBiometricsScreen extends StatefulWidget {
  const SetBiometricsScreen({super.key});

  @override
  State<SetBiometricsScreen> createState() => _SetBiometricsScreenState();
}

class _SetBiometricsScreenState extends State<SetBiometricsScreen> {
  bool _toggled = false;
  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar(
          title: "Quick Setup",
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(3)),
          child: Column(
            children: [
              const ConstColumnSpacer(2),
              SwitchListTile(
                // inactiveTrackColor:AppColors.red,
                tileColor: AppColors.white,
                hoverColor: AppColors.white,
                title: Text(
                  "Biometrics",
                  style: TextStyles.BlackDefaultBoldText,
                ),
                subtitle: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, Ui.getPadding(2), Ui.getPadding(3), Ui.getPadding(0)),
                  child: Text(
                    "Enable biometrics for secure and fast sign-in.",
                    style: TextStyles.BlackDefaultText,
                  ),
                ),
                contentPadding: const EdgeInsets.all(8.0),
                activeColor: AppColors.green,
                value: _toggled, //this is local variable I assigned.
                onChanged: (bool value) {
                  setState(() => _toggled = value);
                },
              ),
              const ConstColumnSpacer(2),
              ListTile(
                title: Text(
                  "App Language",
                  style: TextStyles.BlackDefaultBoldText,
                ),
                subtitle: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, Ui.getPadding(2), Ui.getPadding(3), Ui.getPadding(0)),
                  child: Text(
                      "You can use your proffered language through this application.",
                      style: TextStyles.BlackDefaultText),
                ),
              ),
              const ConstColumnSpacer(2),
              CheckboxListTile(
                title: Text(
                  'English',
                  style: TextStyles.BlackDefaultBoldText,
                ),
                tileColor: AppColors.graylight,
                checkColor: AppColors.white,
                activeColor: AppColors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0), // Adjust the radius as needed
                  ),
                ),
                visualDensity:
                    const VisualDensity(horizontal: 2.0, vertical: 4.0),
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                value: _selectedValue == 1,
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _selectedValue = 1;
                    }
                  });
                },
              ),
              const ConstColumnSpacer(2),
              CheckboxListTile(
                title: Text(
                  'Sinhala',
                  style: TextStyles.BlackDefaultBoldText,
                ),
                tileColor: AppColors.graylight,
                checkColor: AppColors.white,
                activeColor: AppColors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0), // Adjust the radius as needed
                  ),
                ),
                visualDensity:
                    const VisualDensity(horizontal: 2.0, vertical: 4.0),
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                value: _selectedValue == 2,
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _selectedValue = 2;
                    }
                  });
                },
              ),
              const ConstColumnSpacer(2),
              CheckboxListTile(
                title: Text(
                  'Tamil',
                  style: TextStyles.BlackDefaultBoldText,
                ),
                tileColor: AppColors.graylight,
                checkColor: AppColors.white,
                activeColor: AppColors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0), // Adjust the radius as needed
                  ),
                ),
                visualDensity:
                    const VisualDensity(horizontal: 2.0, vertical: 4.0),
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                value: _selectedValue == 3,
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _selectedValue = 3;
                    }
                  });
                },
              ),
              Expanded(
                  child: Center(
                child: MainButton(
                    onpressed: () {
                      pushScreen(context, ScreenRoutes.toDashboardScreen);
                    },
                    text: "Next"),
              ))
            ],
          ),
        ));
  }
}
