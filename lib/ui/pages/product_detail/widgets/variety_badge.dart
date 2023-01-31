import 'package:flutter/material.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class VarietyBadge extends StatelessWidget {
  final String label;
  final BoxBorder? border;
  const VarietyBadge({
    super.key,
    required this.label,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        right: Dimensions.width8,
        top: Dimensions.height8 / 2,
        bottom: Dimensions.height8 / 2,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height16 - 4, vertical: Dimensions.width8 / 2),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Dimensions.radius15 + 1),
        border: border ?? Border.all(color: const Color(0x4d9e9e9e), width: 1),
      ),
      child: Text(
        label,
        textAlign: TextAlign.left,
        overflow: TextOverflow.clip,
        style: boldTextStyle(
          size: Dimensions.font12.toInt(),
        ),
      ),
    );
  }
}
