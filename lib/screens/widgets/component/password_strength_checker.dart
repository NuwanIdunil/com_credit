import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/screens/widgets/component/checkIcon.dart';
import 'package:com_credit_mobile/screens/widgets/row_spacer.dart';
import 'package:flutter/material.dart';

class PasswordStrengthChecker extends StatefulWidget {
  const PasswordStrengthChecker({
    super.key,
    required this.password,
    required this.onStrengthChanged,
  });


  final String password;

  final Function(bool isStrong) onStrengthChanged;

  @override
  State<PasswordStrengthChecker> createState() =>
      _PasswordStrengthCheckerState();
}

class _PasswordStrengthCheckerState extends State<PasswordStrengthChecker> {
  /// Override didUpdateWidget to re-validate password strength when the value
  /// changes in the parent widget
  // @override
  // void didUpdateWidget(covariant PasswordStrengthChecker oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   /// Check if the password value has changed
  //   if (widget.password != oldWidget.password) {
  //     /// If changed, re-validate the password strength
  //     final isStrong = _validators.entries.every(
  //       (entry) => entry.key.hasMatch(widget.password),
  //     );

  //     /// Call callback with new value to notify parent widget
  //     // WidgetsBinding.instance.addPostFrameCallback(
  //     //   (_) => widget.onStrengthChanged(isStrong),
  //     // );
  //   }
  // }
  final Map<RegExp, String> _validators = {
    RegExp(r'^.{8,15}$'): 'A minimum of 8 characters are required.',
    RegExp(r'[A-Z]'): 'At least one uppercase letter is required. ',
    RegExp(r'[a-z]'):'At least one lowercase letter is required. ',
    RegExp(r'\d'): 'At least one number is required. ',
    RegExp(r'[!@#\$%^&*(),.?":{}|<>]'): 'At least one special character is required(@,&,!,?). ',
   
    
  };

  @override
  Widget build(BuildContext context) {
     
    final hasValue = widget.password.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _validators.entries.map(
        (entry) {
         
          final hasMatch = entry.key.hasMatch(widget.password);

          /// Based on the match, we'll show the validation message in green or
          /// red color
          final bordercolor =hasValue ? (hasMatch ? Colors.green : AppColors.gray) : null;
          final backgroundColor=hasValue ? (hasMatch ? Colors.green : AppColors.white) : null;
          final IconColor =hasValue? (hasMatch? Colors.white:AppColors.gray):null;

          return Padding(
            padding: EdgeInsets.only(bottom: Ui.getPadding(1.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CheckIcon(
                  border_color:bordercolor,
                  backgroundColor:backgroundColor ,
                  iconColor: IconColor,
                ),
                RowSpacer(0.4),
                Text(
                  entry.value,
                  style: TextStyle(color: AppColors.black,fontSize: Ui.getFontSize(0.9)),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}