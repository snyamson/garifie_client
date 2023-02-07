import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/auth.dart';
import 'package:garifie_client/core/providers/cart.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/ui/shared/widgets/common_cache_image.dart';
import 'package:garifie_client/ui/shared/widgets/currency_sign.dart';
import 'package:garifie_client/ui/shared/widgets/show_snack_bar.dart';
import 'package:garifie_client/utils/routes/app_pages.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
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
        title: Text("Cart", style: boldTextStyle()),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(Dimensions.height16),
        shrinkWrap: true,
        itemCount: cartItems.length,
        itemBuilder: (_, index) {
          String key = cartItems.keys.elementAt(index);
          final cartItem = cartItems[key];
          return Padding(
            padding: EdgeInsets.only(
              top: Dimensions.height8,
              bottom: Dimensions.height8,
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                //TODO: IMPLEMENT GO TO PRODUCT DETAIILS
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius10 - 2),
                      child: commonCacheImageWidget(
                        cartItem?.img,
                        height: 80,
                        width: 140,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height16,
                    width: Dimensions.width16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cartItem!.name,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(),
                            ),
                            SizedBox(width: Dimensions.height32),
                            GestureDetector(
                              onTap: () {
                                ref.read(cartProvider.notifier).removeFromCart(
                                      cartItem: cartItem,
                                      onSuccess: () {
                                        showSnackBar(
                                          context,
                                          '${cartItem.name} removed from cart',
                                        );
                                      },
                                    );
                              },
                              child: Icon(
                                Icons.delete_outline_outlined,
                                color: Colors.grey.shade500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: Dimensions.height8 / 2),
                        Text(
                          cartItem.description,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: secondaryTextStyle(),
                        ),
                        SizedBox(height: Dimensions.height8 / 2),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Product Type: ',
                                style: boldTextStyle(
                                  size: Dimensions.font13.toInt(),
                                  weight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: cartItem.type,
                                style: secondaryTextStyle(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height8 / 2),
                        Row(
                          children: [
                            Text(
                              '${currencySign().currencySymbol} ${cartItem.amount}.00',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(
                                size: Dimensions.font14.toInt(),
                              ),
                            ),
                            SizedBox(width: Dimensions.height32),
                            Text(
                              'x ${cartItem.quantity}',
                              style: secondaryTextStyle(
                                size: Dimensions.font14.toInt(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
                Text('${cartItems.length}', style: secondaryTextStyle()),
                Text(
                  '${currencySign().currencySymbol} $cartTotal.00',
                  style: boldTextStyle(),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height16),
            Button(
              context: context,
              onPressed: () async {
                final user = await ref.read(authProvider).getAccount();
                if (user == null) {
                  // ignore: use_build_context_synchronously
                  context.pushNamed(Routes.signIn);
                }
                // ignore: use_build_context_synchronously
                context.pushNamed(Routes.confirmOrder);
              },
              title: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
