import 'package:flutter/material.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';

import 'settings.dart';

class OrdersCount extends StatelessWidget {
  final String? processingCount;
  final String? shippedCount;
  final String? deliveredCount;

  const OrdersCount({
    super.key,
    this.processingCount,
    this.shippedCount,
    this.deliveredCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: Dimensions.width16, right: Dimensions.width16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Settings(title: processingCount ?? 'N/A', subtitle: 'Processing'),
          Container(
              height: Dimensions.height32 - 2,
              width: 1,
              color: Colors.grey,
              margin: const EdgeInsets.only(bottom: 16)),
          Settings(title: shippedCount ?? 'N/A', subtitle: 'Shipped'),
          Container(
            height: Dimensions.height32 - 2,
            width: 1,
            color: Colors.grey,
            margin: EdgeInsets.only(bottom: Dimensions.height16),
          ),
          Settings(title: deliveredCount ?? 'N/A', subtitle: 'Delivered'),
        ],
      ),
    );
  }
}
