import 'package:flutter/material.dart';
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
      width: context.width() / 2 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.productItemHeight + Dimensions.height16 - 6,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: img != null
                ? Image.network(
                    img!,
                    height:
                        Dimensions.productItemHeight + Dimensions.height16 - 6,
                    width: context.width() / 2 - 24,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/coconut_gari.jpg',
                    height:
                        Dimensions.productItemHeight + Dimensions.height16 - 6,
                    width: context.width() / 2 - 24,
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
            'Ghs $amount.00',
            style: secondaryTextStyle(
              size: Dimensions.font12.toInt(),
            ),
          ),
        ],
      ),
    );

    // return SizedBox(
    //   width: context.width() / 2 - 24,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Container(
    //         height: Dimensions.productItemHeight,
    //         width: Dimensions.productItemWidth,
    //         decoration: BoxDecoration(
    //           color: Colors.grey.withOpacity(0.2),
    //         ),
    //         child: Stack(
    //           children: [
    //             img != null
    //                 ? Image.network(
    //                     img!,
    //                     height: Dimensions.productItemHeight,
    //                     width: Dimensions.productItemWidth,
    //                     fit: BoxFit.cover,
    //                   )
    //                 : Image.asset(
    //                     'assets/images/coconut_gari.jpg',
    //                     height: Dimensions.productItemHeight,
    //                     width: Dimensions.productItemWidth,
    //                     fit: BoxFit.cover,
    //                   ),
    //             Align(
    //               alignment: Alignment.topRight,
    //               child: Container(
    //                 margin: const EdgeInsets.only(right: 8, top: 4),
    //                 height: Dimensions.height32 - 2,
    //                 width: Dimensions.width32 - 2,
    //                 alignment: Alignment.center,
    //                 decoration: BoxDecoration(
    //                   borderRadius:
    //                       BorderRadius.circular(Dimensions.radius10 * 2),
    //                   color: context.cardColor,
    //                 ),
    //                 child: Icon(Icons.favorite,
    //                     color: Colors.red, size: Dimensions.iconSize17),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(height: Dimensions.height8 / 2),
    //       Text(
    //         subtitle ?? 'Best of Gari Fie Gh',
    //         maxLines: 1,
    //         overflow: TextOverflow.ellipsis,
    //         style: secondaryTextStyle(
    //           size: Dimensions.font12.toInt(),
    //         ),
    //       ),
    //       const SizedBox(height: 4),
    //       SizedBox(
    //         width: context.width() / 2 - 12,
    //         child: Text(
    //           title ?? 'Gari Name',
    //           maxLines: 1,
    //           overflow: TextOverflow.ellipsis,
    //           style: boldTextStyle(
    //             size: Dimensions.font14.toInt(),
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 4),
    //       Text(
    //         amount != null ? 'GHs $amount' : 'GHs 12.00',
    //         style: secondaryTextStyle(
    //           size: Dimensions.font12.toInt(),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
