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
          Container(
            height: Dimensions.productItemHeight + Dimensions.height16 - 6,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(Dimensions.radius10),
            ),
            child: img != null
                ? commonCacheImageWidget(
                    img!,
                    height:
                        Dimensions.productItemHeight + Dimensions.height16 - 6,
                    width: context.width() / 2 - 34,
                  )
                : Image.asset(
                    'assets/images/coconut_gari.jpg',
                    height:
                        Dimensions.productItemHeight + Dimensions.height16 - 6,
                    width: context.width() / 2 - 34,
                    fit: BoxFit.cover,
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
            '${currencySign().currencySymbol} $amount.00',
            style: secondaryTextStyle(
              size: Dimensions.font12.toInt(),
            ),
          ),
        ],
      ),
    );
  }
}
