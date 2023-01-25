import 'package:flutter/material.dart';
import 'package:garifie_client/ui/pages/dashboard/widgets/bottom_nav_bar.dart';

class DashboardView extends StatefulWidget {
  final Widget child;
  const DashboardView({super.key, required this.child});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: widget.child,
    );
  }
}
