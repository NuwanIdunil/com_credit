import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';

class PinNumberPad extends StatelessWidget {
  const PinNumberPad({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.decimal = true,
  }) : super(key: key);

  final bool decimal;
  final TextEditingController? controller;
  final void Function(String pin) onChanged;

  final List<String> numbersList = const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    '0',
    'c',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisSpacing: Ui.padding2,
      mainAxisSpacing: Ui.padding2,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      // crossAxisSpacing: UI.PADDING * 2.5,
      // mainAxisSpacing: UI.PADDING_2X,
      // scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      children: numbersList.map((n) {
        if (n == '') {
          return Container();
        } else if (n == 'c') {
          if (controller!.text.isEmpty) {
            return Container();
          }
          return IconButton(
            onPressed: () {
              if (controller!.text.isEmpty) {
                return;
              }
              String str = controller!.text;
              controller!.text = str.substring(0, str.length - 1);
              onChanged(controller!.text);
            },
            icon: Icon(
              Icons.backspace_outlined,
              color: AppColors.black,
            ),
          );
        } else {
          return _getButtonUI(n);
        }
      }).toList(),
    );
  }

  Widget _getButtonUI(String value) {
    if (!decimal && (value == '.')) {
      return Container();
    }
    return Material(
      shape: CircleBorder(side: BorderSide(color: AppColors.white)),
      /* shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UI.BORDER_RADIUS * 2),
        side: BorderSide(color: AppColors.transparent),
      ), */
      // elevation: value == '.' ? 0 : 1,
      clipBehavior: Clip.antiAlias,
      // shadowColor: AppColors.backgroundBlack,
      color: AppColors.white,
      // color: value == '.'
      //     ? AppColors.transparent
      //     : AppColors.basicGrey.shade600.withOpacity(0.5),
      child: InkWell(
        highlightColor: AppColors.red,
        splashColor: AppColors.red,
        // overlayColor: MaterialStateProperty.all<Color>(AppColors.backgroundBlack),
        onTap: () {
          if (controller!.text.length >= 4) {
            print(
                "LimiT exseed .current value of contoller ${controller!.text}");
            return;
          }
          controller!.text += value;
          onChanged(controller!.text);
        },
        child: Center(
          child: Text(
            value,
            style: TextStyles.defaultText1Bold,
          ),
        ),
      ),
    );
  }
}
