import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:flutter/material.dart';


InputBorder fieldBorder() => OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.graylight,
      ),
      borderRadius: BorderRadius.circular(Ui.getRadius(1.5)),
    );

