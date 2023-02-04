import 'package:flutter/material.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class BestProductLoader extends StatelessWidget {
  const BestProductLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: HorizontalList(
        padding: EdgeInsets.only(
            left: Dimensions.width16, right: Dimensions.width16),
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        spacing: 8,
        itemBuilder: (_, __) => SizedBox(
          width: context.width() / 2 - 34,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Dimensions.productItemHeight + Dimensions.height16 - 6,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                ),
              ),
              SizedBox(height: Dimensions.height8),
              Container(
                width: context.width(),
                height: Dimensions.height8 / 1.2,
                color: Colors.white,
              ),
              SizedBox(height: Dimensions.height8),
              Container(
                width: context.width() / 2,
                height: Dimensions.height8,
                color: Colors.white,
              ),
              SizedBox(height: Dimensions.height8),
              Container(
                width: context.width() / 3,
                height: Dimensions.height8 / 1.2,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
