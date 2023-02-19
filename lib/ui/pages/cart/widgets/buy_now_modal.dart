import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/models/cart.dart';
import 'package:garifie_client/core/providers/cart.dart';
import 'package:garifie_client/core/providers/current_product.dart';
import 'package:garifie_client/core/providers/quantity.dart';
import 'package:garifie_client/ui/pages/product_detail/widgets/variety_badge.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/ui/shared/widgets/common_cache_image.dart';
import 'package:garifie_client/ui/shared/widgets/currency_sign.dart';
import 'package:garifie_client/ui/shared/widgets/show_snack_bar.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class BuyNowModal extends ConsumerWidget {
  const BuyNowModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProduct = ref.watch(currentProductNotifier);
    final currentProductVariant = ref.watch(currentProductVariantProvider);
    final currentProductImageUrl = ref.watch(currentProductImgProvider);
    final quantity = ref.watch(quantityProvider);

    return SizedBox(
      height: context.height() / 1.2,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius10),
          topRight: Radius.circular(Dimensions.radius10),
        ),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: Dimensions.productItemHeight * 1.6,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: currentProduct.variant.isNotEmpty
                        ? commonCacheImageWidget(
                            currentProductImageUrl,
                            height: Dimensions.productDetailImageHeight + 10,
                            width: context.width(),
                          )
                        : commonCacheImageWidget(
                            currentProduct.productImg,
                            height: Dimensions.productDetailImageHeight + 10,
                            width: context.width(),
                          ),
                  ),
                  Positioned(
                    top: Dimensions.height16,
                    right: Dimensions.width16,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white54,
                        child: Icon(
                          Icons.close,
                          color: context.iconColor,
                          size: Dimensions.iconSize28,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currentProduct.variant.isNotEmpty
                                ? '${currencySign().currencySymbol} ${currentProductVariant!.amount}.00'
                                : "not there",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 35),
                          ),
                          const Text('In Stock')
                        ],
                      ),
                      SizedBox(height: Dimensions.height16),
                      Text(
                        "Description",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(),
                      ),
                      SizedBox(height: Dimensions.height8),
                      Text(currentProduct.description,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: secondaryTextStyle()),
                      SizedBox(height: Dimensions.height16),
                      if (currentProduct.variant.isNotEmpty)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Dimensions.height16),
                            Text(
                              "Available In",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: boldTextStyle(
                                size: Dimensions.font14.toInt(),
                              ),
                            ),
                            SizedBox(height: Dimensions.height8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: currentProduct.variant
                                  .map(
                                    (v) => InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        ref
                                            .read(currentProductImgProvider
                                                .notifier)
                                            .update((state) => state = v.img!);
                                        ref
                                            .read(currentProductVariantProvider
                                                .notifier)
                                            .update((state) => state = v);
                                      },
                                      child: VarietyBadge(
                                        label: v.type,
                                        border: Border.all(
                                          width: 1,
                                          color: currentProductImageUrl == v.img
                                              ? Colors.red
                                              : const Color(0x4d9e9e9e),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      SizedBox(height: Dimensions.height16),
                      Text(
                        "Quantity",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(
                          size: Dimensions.font14.toInt(),
                        ),
                      ),
                      SizedBox(height: Dimensions.height8),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: quantity > 1
                                ? () {
                                    ref.read(quantityProvider.notifier).state--;
                                  }
                                : null,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                              ),
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.remove,
                                size: Dimensions.iconSize17,
                                color: quantity <= 1
                                    ? Colors.black12
                                    : Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width8),
                          Text(
                            quantity.toString(),
                            style: boldTextStyle(
                              size: Dimensions.font14.toInt(),
                            ),
                          ),
                          SizedBox(width: Dimensions.width8),
                          GestureDetector(
                            onTap: () {
                              ref.read(quantityProvider.notifier).state++;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                              ),
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                size: Dimensions.iconSize17,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.height16),
                      Text(
                        "Delivery",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(
                          size: Dimensions.font14.toInt(),
                        ),
                      ),
                      SizedBox(height: Dimensions.height8),
                      const Text('Free Delivery'),
                    ],
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
              bottom: Dimensions.height16,
              left: Dimensions.width16,
              right: Dimensions.width16,
            ),
            child: Button(
              context: context,
              title: 'Add to Cart',
              onPressed: () {
                final Cart cartItem = Cart(
                  id: currentProduct.id!,
                  name: currentProduct.name,
                  description: currentProduct.description,
                  type: currentProduct.variant.isNotEmpty
                      ? currentProductVariant!.type
                      : 'None',
                  quantity: quantity,
                  amount: currentProduct.variant.isNotEmpty
                      ? currentProductVariant!.amount
                      : 10,
                  img: currentProduct.variant.isNotEmpty
                      ? currentProductVariant!.img
                      : currentProductImageUrl,
                );
                ref.read(cartProvider.notifier).addToCart(
                      cartItem: cartItem,
                      onSuccess: () {
                        showToast(
                          message: '${cartItem.name} added to cart',
                          isSuccess: true,
                          gravity: ToastGravity.TOP,
                        );
                        Navigator.pop(context);
                      },
                      onError: () {
                        showToast(
                          message: '${cartItem.name} already in cart',
                          isSuccess: false,
                          gravity: ToastGravity.TOP,
                        );
                        Navigator.pop(context);
                      },
                    );
              },
            ),
          ),
        ),
      ),
    );
  }
}
