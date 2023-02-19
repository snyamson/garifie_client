// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Settings extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;
  const Settings({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: boldTextStyle()),
          Text(subtitle, style: secondaryTextStyle(), maxLines: 2),
        ],
      ),
    );
  }
}
