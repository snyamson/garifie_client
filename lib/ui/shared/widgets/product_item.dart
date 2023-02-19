import 'package:flutter/material.dart';
import 'package:garifie_client/ui/shared/widgets/common_cache_image.dart';
import 'package:garifie_client/ui/shared/widgets/currency_sign.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductItem extends StatelessWidget {
  final String? img;
  final String? title;
  final String? subtitle;
  final String? amount;
  const ProductItem({
    Key? key,
    this.img,
    this.title,
    this.subtitle,
    this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width() / 2 - 34,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: title!,
            child: Container(
              height: Dimensions.productItemHeight + Dimensions.height16 - 6,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius10),
                  topRight: Radius.circular(Dimensions.radius10),
                ),
              ),
              child: img != null
                  ? commonCacheImageWidget(
                      img!,
                      height: Dimensions.productItemHeight +
                          Dimensions.height16 -
                          6,
                      width: context.width() / 2 - 34,
                    )
                  : Image.asset(
                      'assets/images/coconut_gari.jpg',
                      height: Dimensions.productItemHeight +
                          Dimensions.height16 -
                          6,
                      width: context.width() / 2 - 34,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width8 / 2,
              right: Dimensions.width8 / 2,
              bottom: Dimensions.height8,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(0, 0.5),
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.radius10),
                bottomRight: Radius.circular(Dimensions.radius10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.height8 / 2),
                SizedBox(
                  width: context.width() / 2 - 12,
                  child: Text(
                    title ?? 'title!',
                    maxLines: 2,
                    style: boldTextStyle(
                      size: Dimensions.font14.toInt(),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height8 / 2),
                Text(
                  subtitle ?? 'subtitle!',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: secondaryTextStyle(
                    size: Dimensions.font12.toInt(),
                  ),
                ),
                SizedBox(height: Dimensions.height8 / 2),
                Text(
                  '${currencySign().currencySymbol} $amount.00',
                  style: secondaryTextStyle(
                    size: Dimensions.font12.toInt(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
