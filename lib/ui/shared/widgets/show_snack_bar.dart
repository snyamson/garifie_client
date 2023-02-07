import 'package:flutter/material.dart';
import 'package:garifie_client/utils/constants/globals.dart';

void showSnackBar(BuildContext context, String text) {
  final SnackBar snackBar = SnackBar(
    content: Text(text),
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}
