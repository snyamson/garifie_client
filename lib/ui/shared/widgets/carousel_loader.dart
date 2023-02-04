import 'package:flutter/material.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class CarouselLoader extends StatelessWidget {
  const CarouselLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Dimensions.carouselImageHeight,
            width: context.width(),
            margin: EdgeInsets.only(
              left: Dimensions.width16,
              right: Dimensions.width16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius10),
            ),
          ),
          SizedBox(height: Dimensions.height16),
          Container(
            height: Dimensions.height16,
            width: Dimensions.width50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius10),
            ),
          ),
          SizedBox(height: Dimensions.height8 / 2),
        ],
      ),
    );
  }
}
