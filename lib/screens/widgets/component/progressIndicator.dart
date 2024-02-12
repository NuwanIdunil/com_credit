import 'package:flutter/material.dart';

class ProgresIndicator extends StatelessWidget {
  const ProgresIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
                    height: 50,
                    width: 50,
                    child: const CircularProgressIndicator(color: Colors.red,)
                  ),
    );
  }
}