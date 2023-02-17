import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/models/delivery_address.dart';
import 'package:garifie_client/ui/pages/auth/widgets/app_text_button.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class AddressItem extends ConsumerWidget {
  final DeliveryAddress address;
  final Function() onEditPress;
  final Function() onSetDefaultPress;
  const AddressItem({
    super.key,
    required this.address,
    required this.onEditPress,
    required this.onSetDefaultPress,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width16,
        right: Dimensions.width16,
      ),
      padding: EdgeInsets.only(
        bottom: Dimensions.height16,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimensions.height16 - 2,
            child: address.isDefault
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(Dimensions.radius10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: Dimensions.height8 / 3,
                        right: Dimensions.width8,
                        left: Dimensions.width8,
                      ),
                      child: Text(
                        'Default',
                        style: primaryTextStyle(
                          color: Colors.white,
                          size: Dimensions.font10.toInt(),
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: Dimensions.width50,
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          address.contactName,
                          style: primaryTextStyle(),
                        ),
                        Text(
                          ' - ${address.mobileNumber}',
                          style: primaryTextStyle(),
                        ),
                      ],
                    ),
                    Text(
                      address.streetName,
                      style: boldTextStyle(),
                    ),
                    Text(
                      address.region,
                      style: boldTextStyle(),
                    ),
                    Text(
                      address.city,
                      style: boldTextStyle(),
                    ),
                    SizedBox(height: Dimensions.height8),
                    Row(
                      children: [
                        AppTextButton(
                          title: 'EDIT',
                          size: 14,
                          onTap: onEditPress,
                        ),
                        SizedBox(width: Dimensions.width16),
                        if (!address.isDefault)
                          AppTextButton(
                            title: 'SET AS DEFAULT',
                            size: 14,
                            onTap: onSetDefaultPress,
                          ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
