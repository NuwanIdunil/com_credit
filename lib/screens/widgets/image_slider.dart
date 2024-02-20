import 'package:carousel_slider/carousel_slider.dart';
import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/icons.dart';
import 'package:com_credit_mobile/utils/screen_util.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../routes.dart';
import '../../utils/navigation_util.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> image = [AppIcons.slider1, AppIcons.slider2, AppIcons.slider3];
  int index = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 665,
          child: Container(
            color: AppColors.white,
            width: ScreenUtil.width,
            child: CarouselSlider(
              options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: false,
                height: double.maxFinite,
                viewportFraction: 1,
                onPageChanged: (pageIndex, reason) {
                  setState(() {
                    index = pageIndex;
                    if (index == 2) {
                      Future.delayed(Duration(seconds: 3), () {
                        pushReplacementScreen(
                            context, ScreenRoutes.towelcomeScreen);
                      });
                    }
                  });
                },
              ),
              items: image.asMap().entries.map((entry) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      //  width:ScreenUtil.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(entry.value),
                              fit: BoxFit.cover)),
                    );
                  },
                );
              }).toList(),
              carouselController: carouselController,
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: SmoothPageIndicator(
            controller: PageController(
              initialPage: index,
            ),
            count: image.length,
            effect: ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: ScreenUtil.width * 0.2,
              spacing: 0,
              dotColor: AppColors.gray2,
              activeDotColor: AppColors.red,
            ),
          ),
        ),
      ],
    );
  }
}
