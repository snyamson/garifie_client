import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardNotifierProvider = StateNotifierProvider<DashboardNotifier, int>(
  (ref) => DashboardNotifier(),
);

class DashboardNotifier extends StateNotifier<int> {
  DashboardNotifier() : super(0);

  void onChangeIndex(int index) {
    state = index;
  }
}
