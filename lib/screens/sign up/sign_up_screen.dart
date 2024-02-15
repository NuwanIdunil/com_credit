import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/bottom_sheet.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/screens/widgets/otp_verification_Sheet.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:com_credit_mobile/utils/validation_util.dart';
import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nicController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final OTPTextEditController _otpController = OTPTextEditController(
    codeLength: 6,
    onCodeReceive: (code) {},
  );
  final nicFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final mobileFocusNode = FocusNode();
  String? _errorText;
  bool isNicOk = false;
  bool isEmailOk = false;
  bool isMobileOk = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: "Sign up",
      ),
      body: Column(
        children: [
          const ConstColumnSpacer(3),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(4.0)),
            child: Text(
              "Create a user account to experience the fastest way of your transactions and payments",
              style: TextStyles.BlackDefaultText,
              textAlign: TextAlign.center,
            ),
          ),
          const ConstColumnSpacer(5),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: ScreenUtil.width * 0.9,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputTextField(
                        textCapitalization: TextCapitalization.characters,
                        nicController,
                        hint: "NIC",
                        validator: validateNicNumber,
                      ),
                      const ConstColumnSpacer(2),
                      InputTextField(
                        textCapitalization: TextCapitalization.none,
                        emailController,
                        hint: "Email",
                        validator: validateEmailAdrees,
                      ),
                      const ConstColumnSpacer(2),
                      InputTextField(
                        mobileController,
                        hint: 'Mobile Number',
                        focus: mobileFocusNode,
                        keyboardType: TextInputType.number,
                        validator: validateMobileNumber,
                      ),
                      const ConstColumnSpacer(5),
                      MainButton(
                          onpressed: () {
                            if (_formKey.currentState!.validate()) {
                              OtpVerificationSheet(
                                  context: context,
                                  otpController: _otpController,
                                  onChanged: (otp) {
                                    if (_otpController.text.length == 6) {
                                      pushScreen(context,
                                          ScreenRoutes.toSignUpPasswordScreen);
                                    }
                                  }).opensheet();
                            }
                          },
                          text: "Get Start"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? validateNicNumber(String? text) {
    return ValidationUtil().validateNotEmpty(text)
        ? ValidationUtil().validateNic(text)
            ? null
            : "Enter valid Nic Number"
        : "Nic_required";
  }

  String? validateEmailAdrees(String? text) {
    return ValidationUtil().validateNotEmpty(text)
        ? ValidationUtil().validateEmail(text)
            ? null
            : "Enter valid email Address"
        : "email_reqiured";
  }

  String? validateMobileNumber(String? text) {
    return ValidationUtil().validateNotEmpty(text)
        ? ValidationUtil().validateMobile(text)
            ? null
            : "Enter valid Mobile Number"
        : "Mobile_reqiured";
  }
}
