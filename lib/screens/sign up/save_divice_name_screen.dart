import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class SetDeviceNameScreen extends StatefulWidget {
  const SetDeviceNameScreen({super.key});

  @override
  State<SetDeviceNameScreen> createState() => _SetDeviceNameScreenState();
}

class _SetDeviceNameScreenState extends State<SetDeviceNameScreen> {
  TextEditingController deviceIdController = TextEditingController();
  String deviceName = '';
  @override
  void initState() {
    super.initState();
    print("Calling getDeviceName function...");
    getDeviceName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: "Device Registration",
      ),
      body: Column(children: [
        const ConstColumnSpacer(5),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(4.5)),
          child: Text(
              "Save this device for commercial credit. Access to the account will be authorized only on registered devices",
              style: TextStyles.defaultText,
              textAlign: TextAlign.center,),
        ),
        const ConstColumnSpacer(5),
        SizedBox(
          width: ScreenUtil.width*0.9,
          child: InputTextField(
            deviceIdController,
            hint: deviceName,
          ),
        ),
        Expanded(child: Center(child: MainButton(onpressed: (){
          pushScreen(context, ScreenRoutes.toSetBiometricsScreen);
        }, text:'Save And Continue'),))
      ]),
      
    );
  }

  Future getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print("Deviceid ");
    print('Running on ${androidInfo.model}');
    setState(() {
      deviceName = "${androidInfo.brand} ${androidInfo.model}";
    });
  }
}
