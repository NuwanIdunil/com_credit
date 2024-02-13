import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/screens/widgets/row_spacer.dart';
import 'package:flutter/material.dart';

class PinLengthIndicator extends StatefulWidget {
  const PinLengthIndicator({super.key, this.length = 0});
  final int length;

  @override
  State<PinLengthIndicator> createState() => _PinLengthIndicatorState();
}

class _PinLengthIndicatorState extends State<PinLengthIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.length >= 1 ? AppColors.red : AppColors.gray,
          ),
        ),
        const RowSpacer(0.8),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.length >= 2 ? AppColors.red : AppColors.gray,
          ),
        ),
        const RowSpacer(0.8),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.length >= 3 ? AppColors.red : AppColors.gray,
          ),
        ),
        const RowSpacer(0.8),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.length >= 4 ? AppColors.red : AppColors.gray,
          ),
        ),
      ],
    );
  }
}
