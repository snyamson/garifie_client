import 'package:flutter/material.dart';
import 'package:garifie_client/ui/shared/widgets/app_text_input.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Checkout", style: boldTextStyle()),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.height16),
            Text(
              "Delivery Address",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: boldTextStyle(),
            ),
            SizedBox(height: Dimensions.height8),
            const AppTextInput(name: 'Delivery Address', maxLines: 7),

            SizedBox(height: Dimensions.height16),
            Text(
              "Delivery Option",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: boldTextStyle(),
            ),
            SizedBox(height: Dimensions.height8),
            // TODO CONTENT 2

            SizedBox(height: Dimensions.height16),
            Text(
              "Summary",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: boldTextStyle(),
            ),
            SizedBox(height: Dimensions.height8),
            Text(
                "Username \n Request .. variety.. of ..product name.. with total amount ..price.. to be delivered",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: secondaryTextStyle()),
            SizedBox(height: Dimensions.height32),
            Button(
              context: context,
              title: 'Place Order',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
