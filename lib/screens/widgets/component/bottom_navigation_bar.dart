import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:flutter/material.dart';

class BottomNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, -10),
      child: Container(
        //height: 95,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppIcons.navbar,
            ),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.graylight,
                blurRadius: 100.0,
                //spreadRadius: 0.5,
                offset: Offset(1, 0)),
          ],
        ),

        //decoration: BoxDecoration()
        //ShapeDecoration(
        //   color: Colors.white,
        //  // shape: MyBorderShape(),
        //   shadows: [
        //     BoxShadow(
        //         color: AppColors.gray, blurRadius: 4.0, offset: Offset(1, 1)),
        //   ],
        // ),

        child: Row(
          //  mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              //  mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppIcons.home, height: 100, width: 60),
                Image.asset(
                  AppIcons.history,
                  height: 100,
                  width: 60,
                ),
              ],
            ),
            Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.send,
                  height: 100,
                  width: 60,
                ),
                Image.asset(
                  AppIcons.menu,
                  height: 100,
                  width: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildMiddleTabItem() {
  //   return const Expanded(
  //     child: SizedBox(
  //       height: 60,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           SizedBox(height: 24),
  //           Text(''),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class MyBorderShape extends ShapeBorder {
  MyBorderShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path(); // Return an empty Path object
  }

  double holeSize = 100;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    print(rect.height);
    return Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(
            RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 4)))
        ..close(),
      Path()
        ..addOval(Rect.fromCenter(
            center: rect.center.translate(0, -rect.height / 2.3),
            height: holeSize,
            width: holeSize))
        ..close(),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
