import 'package:flutter/cupertino.dart';

class ProfileCardPainter extends CustomPainter {
  ProfileCardPainter({required this.color, required this.avatarRadius});

  final Color color;
  final double avatarRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds =
        Rect.fromLTWH(0, 0, size.width, size.height - 30);
    _drawBackground(canvas, shapeBounds, size);
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds, Size size) {
    final paint = Paint()..color = color;

    final backgroundPath = Path();
    final halfWidth = size.width / 2;
    final halfSpace = 100 / 2;
    backgroundPath.lineTo(halfWidth - halfSpace, 0);
    backgroundPath.quadraticBezierTo(
        size.width * 0.10, 0, shapeBounds.width * 0.20, 10);
    backgroundPath.arcToPoint(Offset(size.width * 0.60, 10),
        radius: Radius.circular(20), clockwise: false);
    backgroundPath.quadraticBezierTo(
        size.width * 0.40, 0, shapeBounds.width * 0.45, 0);
    backgroundPath.lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy);
    backgroundPath.lineTo(size.width, size.height);
    backgroundPath.lineTo(0, size.height);
    backgroundPath.close();
    canvas.drawPath(backgroundPath, paint);
  }

  @override
  bool shouldRepaint(ProfileCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}