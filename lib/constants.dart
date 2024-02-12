class Ui {
  static const double actionBarHeight = 75.0;
  static const double padding = 8.0;
  static const double borderRadius = 8.0;
  static const double padding2 = padding * 2;
  static const double fontSize = 14.0;
  static const int animationDuration = 200;

  static getPadding(double times) => padding * times;

  static getRadius(double times) => borderRadius * times;

  static getFontSize(double times) => fontSize * times;
}
