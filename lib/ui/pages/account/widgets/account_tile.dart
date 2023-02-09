import 'package:flutter/material.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class AccountTile extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  const AccountTile({
    super.key,
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height8 / 2,
          bottom: Dimensions.height8 / 2,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title ?? 'Delivery Details',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: boldTextStyle(size: Dimensions.font14.toInt()),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: context.iconColor,
                  size: Dimensions.iconSize17,
                ),
              ],
            ),
            SizedBox(height: Dimensions.height8),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              height: Dimensions.height16,
              thickness: 0,
              indent: 0,
              endIndent: 0,
            ),
          ],
        ),
      ),
    );
  }
}
