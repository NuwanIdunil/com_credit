import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/sign%20up/sign_up_personal_details_screen.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/component/checkIcon.dart';
import 'package:com_credit_mobile/screens/widgets/component/password_strength_checker.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:com_credit_mobile/utils/validation_util.dart';

class RestPasswordScreen extends StatefulWidget {
  const RestPasswordScreen({super.key});

  @override
  State<RestPasswordScreen> createState() => _RestPasswordScreenState();
}

class _RestPasswordScreenState extends State<RestPasswordScreen> {
  final _passwordController = TextEditingController();
  bool _isStrong = false;
  final conformPasswordController = TextEditingController();
  String? _errorText;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: "Sign up",
        isLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstColumnSpacer(
                MediaQuery.of(context).viewInsets.bottom > 0 ? 1 : 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(4.5)),
              child: Text(
                "Create a user account to experience the fastest way of your transactions and payments",
                style: TextStyles.BlackDefaultText,
                textAlign: TextAlign.center,
              ),
            ),
            ConstColumnSpacer(
                MediaQuery.of(context).viewInsets.bottom > 0 ? 2 : 5),
            SizedBox(
              width: ScreenUtil.width * 0.9,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputTextField(
                      _passwordController,
                      errorText: _errorText,
                      validator: validatePassword,
                      hint: 'Create your password',
                      obscureText: true,
                    ),
                    const ConstColumnSpacer(2),
                    InputTextField(
                      validator: validateConformPassword,
                      conformPasswordController,
                      hint: 'Re enter your',
                      obscureText: true,
                    ),
                    ConstColumnSpacer(
                        MediaQuery.of(context).viewInsets.bottom > 0 ? 1 : 5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil.width * 0.04),
                      child: AnimatedBuilder(
                        animation: _passwordController,
                        builder: (context, child) {
                          final password = _passwordController.text;

                          return PasswordStrengthChecker(
                            onStrengthChanged: (bool value) {
                              setState(() {
                                _isStrong = value;
                              });
                            },
                            password: password,
                          );
                        },
                      ),
                    ),
                    ConstColumnSpacer(
                        MediaQuery.of(context).viewInsets.bottom > 0 ? 2 : 5),
                    MainButton(
                        onpressed: () {
                          if (_formKey.currentState!.validate()) {
                            pushScreen(context,
                                ScreenRoutes.toSignUpPersonalDetailsScreen);
                          }
                        },
                        text: "Next"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validatePassword(String? password) {
    if (!ValidationUtil().validateNotEmpty(password)) {
      return "password_required";
    }

    if (password!.length < 8 || password.length > 15) {
      return 'password_must_be_8_or_15_char';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'password_must_contain_upper_case';
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'password_must_contain_lower_case';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'password_must_contain_number';
    }

    if (!password.contains(RegExp(r'[!@#\$%^&*()_\-+={}[\]|;:"<>,.?/]'))) {
      return 'password_must_contain_special_char';
    }

    // for (int i = 0; i < password.length - 1; i++) {
    //   if (password[i] == password[i + 1]) {
    //     return getLangStr(context, 'password_must_not_repeat');
    //   }
    // }
    if (ValidationUtil().validateNotEmpty(password)) {
      _errorText = null;
    }

    return null;
  }

  String? validateConformPassword(
    String? confrompassword,
  ) {
    if (!ValidationUtil().validateNotEmpty(confrompassword)) {
      return "Conform password_required";
    }

    if (ValidationUtil().validateNotEmpty(_passwordController.text) &&
        confrompassword != _passwordController.text) {
      return "Password are not matched";
    }

    return null;
  }
}
