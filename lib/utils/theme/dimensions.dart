import 'package:flutter/cupertino.dart';

class Dimensions {
  static double screenHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  static double screenWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

// Carousel Image Container
  static double carouselImageHeight = screenHeight / 3.452;
  static double productItemHeight = screenHeight / 4.975;
  static double productItemWidth = screenHeight / 5.638;
  static double arrivalProductItemHeight = screenHeight / 3.383;

  // Dynamic Sizes for Padding and Margin
  static double height8 = screenHeight / 105.714;
  static double height16 = screenHeight / 52.857;
  static double height32 = screenHeight / 26.423;
  static double height50 = screenHeight / 16.914;

  // Dynamic Sizes for Padding and Margin
  static double width8 = screenHeight / 105.714;
  static double width16 = screenHeight / 52.857;
  static double width32 = screenHeight / 26.423;
  static double width50 = screenHeight / 16.914;

  // Dynamic Sizes for FontSize
  static double font10 = screenHeight / 84.571;
  static double font12 = screenHeight / 70.476;
  static double font13 = screenHeight / 65.055;
  static double font14 = screenHeight / 60.408;
  static double font26 = screenHeight / 32.527;

  // Dynamic Sizes for BorderRadius
  static double radius4 = screenHeight / 211.428;
  static double radius10 = screenHeight / 84.571;
  static double radius15 = screenHeight / 56.381;

  //Icon Size
  static double iconSize17 = screenHeight / 49.748;
  static double iconSize20 = screenHeight / 42.286;
  static double iconSize24 = screenHeight / 35.238;
  static double iconSize28 = screenHeight / 30.204;
  static double iconSize32 = screenHeight / 26.428;
  static double iconSize48 = screenHeight / 17.619;
}
