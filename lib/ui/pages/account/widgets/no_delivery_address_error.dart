import 'package:flutter/material.dart';
import 'package:garifie_client/utils/routes/app_pages.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class NoDeliveryAddressError extends StatelessWidget {
  const NoDeliveryAddressError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width16),
      height: Dimensions.height50 - 10,
      width: double.maxFinite,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Add a delivery address to your account',
              style: boldTextStyle(
                color: Colors.white,
                size: 13,
              )),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.deliveryAddress);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Text(
                'Add Address',
                style: primaryTextStyle(
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
