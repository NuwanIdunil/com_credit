import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class Sharebuttom extends StatefulWidget {
  final Function? onTap;
  const Sharebuttom({super.key, this.onTap});

  @override
  State<Sharebuttom> createState() => _SharebuttomState();
}

class _SharebuttomState extends State<Sharebuttom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Ui.getRadius(1.5)),
      ),
      onTap: () {
        widget.onTap!();
      },
      child: Ink(
        width: Ui.getPadding(20),
        height: Ui.getPadding(7),
        decoration: BoxDecoration(
            color: AppColors.graylight,
            borderRadius: BorderRadius.all(Radius.circular(Ui.getRadius(1.5)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Share',
              style: TextStyles.BlackDefaultBoldText,
            ),
            Icon(Icons.share_outlined)
          ],
        ),
      ),
    );
  }
}
