import 'dart:io';

import 'package:intl/intl.dart';

NumberFormat currencySign() {
  return NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'GHS');
}
