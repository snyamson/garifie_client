import 'package:flutter/material.dart';
import 'package:garifie_client/ui/shared/widgets/app_text_input.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  @override
  Widget build(BuildContext context) {
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
        title: Text("Add New Address", style: boldTextStyle()),
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
        padding: EdgeInsets.only(
          top: Dimensions.height16,
          left: Dimensions.width16,
          right: Dimensions.width16,
          bottom: Dimensions.height16,
        ),
        child: Column(
          children: [
            Container(
              color: Colors.grey.withOpacity(0.05),
              child: Column(
                children: const [
                  AppTextInput(name: 'Contact Name'),
                  AppTextInput(name: 'Mobile Number'),
                ],
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.05),
              child: Column(
                children: const [
                  AppTextInput(name: 'Street/House/Apartment/Unit'),
                  AppTextInput(name: 'Region'),
                  AppTextInput(name: 'City'),
                ],
              ),
            ),
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
          title: 'SAVE',
          onPressed: () {},
        ),
      ),
    );
  }
}
