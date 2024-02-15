import 'package:com_credit_mobile/colors.dart';
import 'package:flutter/material.dart';

import '../utils/text_Style.dart';

class AppLanguageChangeIcon extends StatefulWidget {
  const AppLanguageChangeIcon({super.key});

  @override
  State<AppLanguageChangeIcon> createState() => _AppLanguageChangeIconState();
}

class _AppLanguageChangeIconState extends State<AppLanguageChangeIcon> {
  String dropdownValue = 'Sin';
  var items = ['Sin', 'Eng', 'Tam'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            spreadRadius: 1,
            // offset: Offset(4, 4),
          ),
        ],
        color: AppColors.white, // Set the color here instead
      ),
      child: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down, size: 15),
          elevation: 4,
          alignment: Alignment.centerRight,
          style: TextStyles.BlackDefaultText,
          underline: Container(),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
