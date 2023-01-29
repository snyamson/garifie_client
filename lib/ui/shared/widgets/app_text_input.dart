import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AppTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String name;
  final bool? isPassword;
  final IconData? icon;
  final Function(String)? onChanged;
  final int maxLines;
  final TextInputType? keyboardType;
  const AppTextInput({
    Key? key,
    this.controller,
    required this.name,
    this.icon,
    this.onChanged,
    this.isPassword,
    this.maxLines = 1,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ?? false,
      textAlign: TextAlign.start,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
      ),
      decoration: sSInputDecoration(
        context: context,
        name: name,
        icon: icon != null
            ? Icon(
                icon,
                color: Colors.grey.withOpacity(0.4),
                size: 24,
              )
            : null,
      ),
      validator: (value) {
        if (value.isEmptyOrNull) {
          return '$name is required';
        }
        if (value != null) {
          if (name == 'Password' && value.length <= 7) {
            return '$name should be at least 8 characters';
          }
          if (name == 'Email' &&
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return '$name is not valid';
          }
        }
        return null;
      },
    );
  }

  InputDecoration sSInputDecoration(
      {String? name, BuildContext? context, Widget? icon}) {
    return InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
      ),
      labelText: name,
      labelStyle: primaryTextStyle(),
      hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000)),
      filled: true,
      fillColor: const Color(0xfff2f2f3),
      isDense: false,
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      suffixIcon: icon,
    );
  }
}
