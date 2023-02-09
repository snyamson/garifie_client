import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garifie_client/utils/constants/globals.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';

void showSnackBar(BuildContext context, String text) {
  final SnackBar snackBar = SnackBar(
    content: Text(text),
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}

void showToast({required String message, required bool isSuccess}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor:
        isSuccess ? Colors.greenAccent.shade400 : Colors.redAccent.shade400,
    textColor: Colors.white,
    fontSize: Dimensions.font13,
  );
}
