import 'dart:io';

import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/widgets/button.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/app_bar.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/screens/widgets/input_text_field.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:com_credit_mobile/utils/validation_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPersanalDetailsScreen extends StatefulWidget {
  const SignUpPersanalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPersanalDetailsScreen> createState() =>
      _SignUpPersanalDetailsScreenState();
}

class _SignUpPersanalDetailsScreenState
    extends State<SignUpPersanalDetailsScreen> {
  final _nameController = TextEditingController();
  final _addressNumberController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        title: "Personal details",
        isLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Part: Circular Avatar
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ColumnSpacer(
                      MediaQuery.of(context).viewInsets.bottom > 0 ? 0.5 : 2),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Ui.getPadding(4.5)),
                    child: Text(
                      "Create a user account to experience the fastest way of your transactions and payments",
                      style: TextStyles.BlackDefaultText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ColumnSpacer(
                      MediaQuery.of(context).viewInsets.bottom > 0 ? 0.5 : 2),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: ScreenUtil.width * 0.20,
                        backgroundColor: AppColors.graylight,
                        backgroundImage: imageXFile == null
                            ? null
                            : FileImage(File(imageXFile!.path)),
                        child: imageXFile == null
                            ? Icon(
                                Icons.person,
                                color: AppColors.gray,
                                size: ScreenUtil.width * 0.4,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 15,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColors.black,
                          radius: ScreenUtil.width * 0.04,
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.graylight,
                            ),
                            onPressed: () {
                              _getimage();
                              print("pressed");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil.width * 0.04),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ConstColumnSpacer(
                        MediaQuery.of(context).viewInsets.bottom > 0 ? 2 : 3),
                    InputTextField(
                      _nameController,
                      hint: 'Name',
                      validator: ValidateUserName,
                    ),
                    const ConstColumnSpacer(2),
                    InputTextField(
                      _addressNumberController,
                      hint: 'Address Number',
                      validator: ValidateAdress,
                    ),
                    const ConstColumnSpacer(2),
                    InputTextField(
                      _streetController,
                      hint: 'Street Name',
                    ),
                    const ConstColumnSpacer(2),
                    InputTextField(
                      _cityController,
                      hint: 'City',
                      validator: ValidateAdress,
                    ),
                    const ColumnSpacer(2),
                    MainButton(
                        onpressed: () {
                          if (_formKey.currentState!.validate()) {
                            pushScreen(context, ScreenRoutes.toPinEnterScreeen);
                          }
                        },
                        text: "Next"),
                    const ColumnSpacer(2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getimage() async {
    bool IsCameraSelectd = false;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Select Image from'),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    imageXFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    Navigator.pop(context);
                    setState(() {
                      imageXFile;
                    });
                  },
                  child: Text('Camera')),
              TextButton(
                onPressed: () async {
                  imageXFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    imageXFile;
                  });
                  Navigator.pop(context);
                },
                child: Text('Gallary'),
              )
            ],
          );
        });

    print(imageXFile);
  }

  String? ValidateUserName(String? Username) {
    return ValidationUtil().validateNotEmpty(Username)
        ? ValidationUtil().validateTwoNames(Username)
            ? null
            : "Enter Valid User Name"
        : "user name reqired";
  }

  String? ValidateAdress(String? address) {
    return ValidationUtil().validateNotEmpty(address)
        ? null
        : "Adreess reqired";
  }
}
