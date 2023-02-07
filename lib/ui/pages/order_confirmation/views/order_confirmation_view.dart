import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/cart.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/ui/shared/widgets/currency_sign.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderConfirmationView extends ConsumerWidget {
  const OrderConfirmationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartTotal = ref.watch(cartProvider.notifier).cartTotal();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: const Color(0x00000000),
            width: context.width() / context.width(),
          ),
        ),
        title: Text("Order Confirmation", style: boldTextStyle()),
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: context.iconColor,
            size: Dimensions.iconSize20,
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          top: Dimensions.height8,
          left: Dimensions.width16,
          right: Dimensions.width16,
          bottom: Dimensions.height16,
        ),
        height: context.height() / 6.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: context.cardColor,
          boxShadow: defaultBoxShadow(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height16),
            topRight: Radius.circular(Dimensions.height16),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: Dimensions.height16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: secondaryTextStyle()),
                Text(
                  '${currencySign().currencySymbol} $cartTotal.00',
                  style: boldTextStyle(),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height16),
            Button(
              context: context,
              onPressed: () async {},
              title: 'Pay now',
            ),
          ],
        ),
      ),
    );
  }
}
