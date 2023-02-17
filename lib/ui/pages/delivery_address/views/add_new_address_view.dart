import 'package:flutter/material.dart';
import 'package:garifie_client/core/models/delivery_address.dart';
import 'package:garifie_client/core/providers/delivery_address.dart';
import 'package:garifie_client/ui/shared/widgets/app_text_input.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/ui/shared/widgets/show_snack_bar.dart';
import 'package:garifie_client/utils/theme/app_colors.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewAddressView extends ConsumerStatefulWidget {
  final DeliveryAddress? addressToEdit;
  const AddNewAddressView({super.key, this.addressToEdit});

  @override
  ConsumerState<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends ConsumerState<AddNewAddressView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _contactName = '';
  String _mobileNumber = '';
  String _street = '';
  String _region = '';
  String _city = '';
  bool _isDefault = false;

  bool _isLoading = false;

  void _loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _onPressedFunction(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _loading();
    try {
      DeliveryAddress address = DeliveryAddress(
        id: widget.addressToEdit?.id,
        userId: widget.addressToEdit?.userId,
        contactName: _contactName.trim(),
        mobileNumber: _mobileNumber.trim(),
        streetName: _street.trim(),
        region: _region.trim(),
        city: _city.trim(),
        isDefault: _isDefault,
      );

      await ref.read(userDeliveryAddressProvider.notifier).addDeliveryAddress(
          address: address,
          isUpdate: ref.read(editDeliveryAddressProvider),
          onSuccess: () {
            _loading(); // Stop Loader
            context.pop();

            showToast(
                message: ref.read(editDeliveryAddressProvider)
                    ? 'Updated Delivery Address'
                    : 'Delivery Address Added',
                isSuccess: true);
            ref
                .read(editDeliveryAddressProvider.notifier)
                .update((state) => false);
          },
          onError: (e) {
            _loading(); // Stop Loader
            context.pop();

            showToast(message: e, isSuccess: false);
            ref
                .read(editDeliveryAddressProvider.notifier)
                .update((state) => false);
          });
    } on Exception {
      _loading();
    }
  }

  @override
  void initState() {
    super.initState();
    _contactName = widget.addressToEdit?.contactName ?? '';
    _mobileNumber = widget.addressToEdit?.mobileNumber ?? '';
    _street = widget.addressToEdit?.streetName ?? '';
    _region = widget.addressToEdit?.region ?? '';
    _city = widget.addressToEdit?.city ?? '';
    _isDefault = widget.addressToEdit?.isDefault ?? _isDefault;
  }

  @override
  Widget build(BuildContext context) {
    final isEditAddress = ref.watch(editDeliveryAddressProvider);
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
        title: Text(isEditAddress ? "Edit Delivery Address" : "Add New Address",
            style: boldTextStyle()),
        leading: InkWell(
          onTap: () {
            context.pop();
            if (isEditAddress) {
              ref
                  .read(editDeliveryAddressProvider.notifier)
                  .update((state) => false);
            }
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: context.iconColor,
            size: Dimensions.iconSize20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: Dimensions.height16,
          left: Dimensions.width16,
          right: Dimensions.width16,
          bottom: Dimensions.height16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height8,
                  bottom: Dimensions.height8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Personal Information', style: boldTextStyle()),
                    SizedBox(height: Dimensions.height16),
                    AppTextInput(
                      name: 'Contact Name',
                      icon: Icons.person,
                      initialValue: widget.addressToEdit?.contactName ?? '',
                      onChanged: (value) {
                        setState(() {
                          _contactName = value;
                        });
                      },
                    ),
                    SizedBox(height: Dimensions.height8),
                    AppTextInput(
                      name: 'Mobile Number',
                      icon: Icons.phone_android_outlined,
                      initialValue: widget.addressToEdit?.mobileNumber ?? '',
                      onChanged: (value) {
                        setState(() {
                          _mobileNumber = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height16),
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height8,
                  bottom: Dimensions.height8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address', style: boldTextStyle()),
                    SizedBox(height: Dimensions.height16),
                    AppTextInput(
                      name: 'Street/House/Apartment',
                      icon: Icons.apartment_outlined,
                      initialValue: widget.addressToEdit?.streetName ?? '',
                      onChanged: (value) {
                        setState(() {
                          _street = value;
                        });
                      },
                    ),
                    SizedBox(height: Dimensions.height8),
                    AppTextInput(
                      name: 'Region',
                      icon: Icons.my_location_outlined,
                      initialValue: widget.addressToEdit?.region ?? '',
                      onChanged: (value) {
                        setState(() {
                          _region = value;
                        });
                      },
                    ),
                    SizedBox(height: Dimensions.height8),
                    AppTextInput(
                      name: 'City',
                      icon: Icons.add_home_outlined,
                      initialValue: widget.addressToEdit?.city ?? '',
                      onChanged: (value) {
                        setState(() {
                          _city = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height50),
              Container(
                color: Colors.grey.withOpacity(0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Set as default delivery address',
                        style: primaryTextStyle()),
                    Switch(
                      value: _isDefault,
                      activeColor: appBackgroundColorDark,
                      onChanged: (value) {
                        setState(() {
                          _isDefault = value;
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
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
          title: _isLoading ? 'SAVING' : 'SAVE',
          color: _isLoading ? Colors.black26 : Colors.black,
          onPressed: () async {
            _isLoading ? null : _onPressedFunction(context);
          },
        ),
      ),
    );
  }
}
