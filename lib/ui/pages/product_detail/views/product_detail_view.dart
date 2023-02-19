import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/current_product.dart';
import 'package:garifie_client/ui/pages/cart/widgets/buy_now_modal.dart';
import 'package:garifie_client/ui/pages/product_detail/widgets/variety_badge.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/ui/shared/widgets/common_cache_image.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProduct = ref.watch(currentProductNotifier);
    final currentProductVariant = ref.watch(currentProductVariantProvider);
    final currentProductImageUrl = ref.watch(currentProductImgProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          currentProduct.name,
          style: boldTextStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: const Color(0x00000000),
            width: context.height() / context.height(),
          ),
        ),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
              child: currentProduct.variant.isNotEmpty
                  ? Stack(
                      children: [
                        Hero(
                          tag: currentProduct.name,
                          child: commonCacheImageWidget(
                            currentProductImageUrl,
                            height: Dimensions.productDetailImageHeight + 10,
                            width: context.width(),
                          ),
                        ),
                        Positioned(
                          bottom: Dimensions.height8,
                          left: Dimensions.width16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: currentProduct.variant.map((e) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                radius: 8,
                                onTap: () {
                                  ref
                                      .read(currentProductImgProvider.notifier)
                                      .update(
                                        (state) => state = e.img!,
                                      );
                                  ref
                                      .read(currentProductVariantProvider
                                          .notifier)
                                      .update((state) => state = e);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: context.cardColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: currentProductImageUrl == e.img
                                          ? Colors.red
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2)),
                                      height: 40,
                                      width: 40,
                                      child: commonCacheImageWidget(
                                        e.img.validate(),
                                        height: 40,
                                        width: 40,
                                      )),
                                ),
                              ).paddingRight(8);
                            }).toList(),
                          ),
                        ),
                      ],
                    )
                  : Hero(
                      tag: currentProduct.name,
                      child: commonCacheImageWidget(
                        currentProduct.productImg,
                        height: Dimensions.productDetailImageHeight + 10,
                        width: context.width(),
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width16,
                right: Dimensions.width16,
                bottom: Dimensions.height16,
                top: Dimensions.height16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(currentProduct.name,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: boldTextStyle()),
                      Text(
                          currentProduct.variant.isNotEmpty
                              ? 'Ghs ${currentProductVariant!.amount}.00'
                              : "not there",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: boldTextStyle()),
                    ],
                  ),
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
                                        .read(
                                            currentProductImgProvider.notifier)
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
                  Text(
                    "Ingredients",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: boldTextStyle(),
                  ),
                  SizedBox(height: Dimensions.height8),
                  Text(
                    currentProduct.ingredients,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: secondaryTextStyle(),
                  ),
                  SizedBox(height: Dimensions.height16),
                  Text(
                    "Health Benefit",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: boldTextStyle(),
                  ),
                  SizedBox(height: Dimensions.height8),
                  Text(
                    currentProduct.healthBenefit,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: secondaryTextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Dimensions.height16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(Dimensions.radius10 - 2)),
              padding: EdgeInsets.all(Dimensions.radius10 - 2),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            SizedBox(width: Dimensions.width8),
            Expanded(
              child: Button(
                context: context,
                title: 'Buy Now',
                onPressed: () {
                  showBarModalBottomSheet(
                    barrierColor: Colors.black38,
                    backgroundColor: Colors.transparent,
                    shape: Border.all(color: Colors.transparent),
                    elevation: 0,
                    clipBehavior: Clip.hardEdge,
                    isDismissible: false,
                    enableDrag: true,
                    duration: const Duration(milliseconds: 300),
                    context: context,
                    builder: (_) => const BuyNowModal(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
