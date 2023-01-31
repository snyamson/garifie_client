import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/current_product.dart';
import 'package:garifie_client/ui/pages/product_detail/widgets/variety_badge.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class BuyNowModal extends ConsumerWidget {
  const BuyNowModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProduct = ref.watch(currentProductNotifier);
    final currentProductVariant = ref.watch(currentProductVariantProvider);
    final currentProductImageUrl = ref.watch(currentProductImgProvider);

    return SizedBox(
      height: context.height() / 1.1,
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
                      ? Image(
                          image: NetworkImage(currentProductImageUrl),
                          height: Dimensions.productDetailImageHeight + 10,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        )
                      : Image(
                          image: NetworkImage(currentProduct.productImg),
                          height: Dimensions.productDetailImageHeight + 10,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                  top: Dimensions.height16,
                  right: Dimensions.width16,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: Dimensions.height50,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10 * 3),
                      ),
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
                                ? 'Ghs ${currentProductVariant!.amount}.00'
                                : "not there",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 35)),
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
                    SizedBox(height: Dimensions.height16),
                    const Text('Free Shipping'),
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
            title: 'Continue',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
