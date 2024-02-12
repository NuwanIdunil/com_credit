import 'dart:ui';

import 'package:flutter/material.dart';

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Adjust the values here to move the button as needed
    return Offset(150,700);
  }

  @override
  String toString() => 'CustomFloatingActionButtonLocation';
}
