import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:garifie_client/core/models/delivery_address.dart';
import 'package:garifie_client/core/providers/delivery_address.dart';
import 'package:garifie_client/ui/pages/delivery_address/widgets/address_item.dart';
import 'package:garifie_client/ui/shared/pages/app_loader.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/ui/shared/widgets/show_snack_bar.dart';
import 'package:garifie_client/utils/routes/app_pages.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class DeliveryAddressView extends ConsumerStatefulWidget {
  const DeliveryAddressView({super.key});

  @override
  ConsumerState<DeliveryAddressView> createState() =>
      _DeliveryAddressViewState();
}

class _DeliveryAddressViewState extends ConsumerState<DeliveryAddressView> {
  bool _isLoading = false;

  void _loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void onSetDefaultPress(DeliveryAddress address) {
    _loading();
    ref.read(userDeliveryAddressProvider.notifier).setDefaultAddress(
          id: address.id!,
          onSuccess: () {
            _loading();
            showToast(message: 'Default Address Updated', isSuccess: true);
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final deliveryAddressesFuture = ref.watch(deliveryAddressListProvider);
    final deliveryAddressList = ref.watch(userDeliveryAddressProvider);

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
        title: Text("Delivery Address", style: boldTextStyle()),
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
      body: Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height16,
          bottom: Dimensions.height50 + Dimensions.height16,
        ),
        child: Stack(
          children: [
            deliveryAddressesFuture.when(
              data: (data) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  final DeliveryAddress address = deliveryAddressList[index];
                  return AddressItem(
                    address: address,
                    onEditPress: () {
                      ref
                          .read(editDeliveryAddressProvider.notifier)
                          .update((state) => true);
                      context.pushNamed(
                        Routes.addNewAddress,
                        extra: address,
                      );
                    },
                    onSetDefaultPress: () {
                      onSetDefaultPress(address);
                    },
                  );
                },
                separatorBuilder: (_, index) =>
                    SizedBox(height: Dimensions.height8),
                itemCount: deliveryAddressList.length,
              ),
              error: (error, _) => Center(
                child: Text(error.toString()),
              ),
              loading: () => Center(
                child: SpinKitDoubleBounce(
                  color: Colors.grey.withOpacity(0.2),
                  size: 48,
                ),
              ),
            ),
            if (_isLoading) const AppLoader()
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          top: Dimensions.height8,
          left: Dimensions.width16,
          right: Dimensions.width16,
          bottom: Dimensions.height16,
        ),
        child: Button(
          context: context,
          title: 'ADD NEW ADDRESS',
          onPressed: () {
            context.pushNamed(Routes.addNewAddress);
          },
        ),
      ),
    );
  }
}
