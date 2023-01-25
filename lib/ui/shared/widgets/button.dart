import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final BuildContext context;
  final Color? color;
  final Color? textColor;
  final BorderSide? borderSide;

  const Button({
    Key? key,
    this.onPressed,
    this.title,
    required this.context,
    this.color,
    this.textColor,
    this.borderSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      elevation: 0,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: borderSide ?? BorderSide.none,
      ),
      text: title,
      color: color ?? const Color(0xff000000),
      textColor: textColor ?? const Color(0xfffffbfb),
      onTap: () {
        onPressed != null ? onPressed!() : null;
      },
      width: context.width(),
    );
  }
}
