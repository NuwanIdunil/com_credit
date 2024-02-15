import 'dart:io';

import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/decorator_util.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
    this.controller, {
    super.key,
    this.hint,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
    this.enabled = true,
    this.textInputAction,
    this.autovalidate,
    this.contentPadding,
    this.focus,
    this.onChanged,
    this.prefixText,
    this.ignoreFormatter,
    this.errorText,
    this.textCapitalization = TextCapitalization.words,
  });

  final TextEditingController controller;
  final String? hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String? input)? validator;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final bool? autovalidate;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focus;
  final Function(String)? onChanged;
  final String? prefixText;
  final bool? ignoreFormatter;
  final String? errorText;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      focusNode: focus,
      maxLength: maxLength ?? 200,
      cursorColor: AppColors.black,
      keyboardType: keyboardType,
      style: TextStyles.BlackDefaultText,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization!,
      decoration: InputDecoration(
        // border: InputBorder.none,
        errorText: errorText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 4),
          child: Text(prefixText ?? ''),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 12),
        prefixStyle: TextStyles.BlackDefaultText.copyWith(color: AppColors.red),
        suffixIconConstraints: const BoxConstraints(minWidth: 12),
        suffixStyle: TextStyles.BlackDefaultText.copyWith(color: AppColors.red),
        hintText: hint ?? '',
        hintStyle: TextStyle(
          color: AppColors.black.withOpacity(0.5),
          fontSize: Ui.getFontSize(1.2),
        ),
        counterText: '',
        border: fieldBorder(),
        focusedBorder: fieldBorder(),
        // errorBorder: fieldBorder(),
        //focusedErrorBorder: fieldBorder(),
        enabledBorder: fieldBorder(),
        disabledBorder: fieldBorder(),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: Ui.padding2,
              vertical: Ui.padding2,
            ),
        filled: true,
        fillColor: AppColors.graylight,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: suffixIcon,
        ),
      ),
      obscureText: obscureText,
      validator: validator,
      enabled: enabled,
      onChanged: (value) {
        onChanged?.call(value);
      },
    );
  }
}
