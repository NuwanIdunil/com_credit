import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "This is a secure 128-bit SSL encrypted payment",
      style: TextStyles.versionText
          .copyWith(color: AppColors.gray, fontWeight: FontWeight.w600),
    );
  }
}
