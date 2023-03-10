import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final int? size;
  const AppTextButton({
    required this.title,
    this.onTap,
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: boldTextStyle(color: Colors.redAccent, size: size ?? 16),
      ),
    );
  }
}
