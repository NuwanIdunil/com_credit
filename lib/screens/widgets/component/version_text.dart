import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class VersionText extends StatelessWidget {
  const VersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(

                  "Version 1.0 Powered by Commercial Credit & Finance PLC",
                  style: TextStyles.versionText,
                
    );
  }
}