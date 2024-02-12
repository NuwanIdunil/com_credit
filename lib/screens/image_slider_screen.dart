import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/screens/widgets/columnSpacer.dart';
import 'package:com_credit_mobile/screens/widgets/component/version_text.dart';
import 'package:com_credit_mobile/screens/widgets/image_slider.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:flutter/material.dart';



class ImageSliderScreen extends StatefulWidget {
  const ImageSliderScreen({super.key});

  @override
  State<ImageSliderScreen> createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.white,
      body: Column(
        children: [
          Expanded(
            flex: 672,
            child: Container(
              color: AppColors.gray2,
              child: ImageSlider(),
            ),
          ),
          Expanded(
            flex: 150,
            child: Column(
              children: [
                const ColumnSpacer(1),
                Image.asset(
                  AppIcons.logo,
                  height: ScreenUtil.height * 0.09,
                  width: ScreenUtil.width * 0.25,
                ),
                const ColumnSpacer(1),
               const VersionText(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
