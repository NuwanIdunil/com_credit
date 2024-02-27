import 'package:com_credit_mobile/constants.dart';
import 'package:flutter/material.dart';

class BellIcon extends StatelessWidget {
  BellIcon({super.key, required this.onTap});

  void Function()? onTap;

  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Ui.getRadius(3)),
      onTap: onTap,
      child: Ink(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
