import 'package:flutter/material.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class NewArrivalLoader extends StatelessWidget {
  const NewArrivalLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Responsive(
        mobile: ListView.builder(
          padding: EdgeInsets.only(
            top: Dimensions.height16,
            left: Dimensions.width16,
            right: Dimensions.width16,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Container(
                  height: Dimensions.arrivalProductItemHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  margin: EdgeInsets.only(bottom: Dimensions.height8),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
