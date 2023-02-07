import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:garifie_client/utils/theme/app_colors.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isLoading;
  const RoundButton({this.onTap, Key? key, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading == true ? null : onTap,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isLoading == true
              ? iconColorSecondary.withOpacity(0.5)
              : const Color(0xFF0706A7),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0x4df2e4e4), width: 1),
        ),
        child: isLoading == true
            ? const SpinKitDoubleBounce(
                size: 30,
                color: Colors.white,
              )
            : const Icon(Icons.arrow_forward,
                color: Color(0xfffcfdff), size: 24),
      ),
    );
  }
}
