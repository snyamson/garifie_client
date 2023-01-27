import 'package:flutter/material.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/utils/routes/app_pages.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

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
        title: Text("Cart", style: boldTextStyle()),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(Dimensions.height16),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: Dimensions.height8,
              bottom: Dimensions.height8,
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                // SSDetailScreen(img: list[index].img).launch(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius10 - 2),
                      child: const Image(
                          image: AssetImage('assets/images/coconut_gari.jpg'),
                          height: 80,
                          width: 140,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height16,
                    width: Dimensions.width16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'list[index].name!',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(),
                      ),
                      SizedBox(height: Dimensions.height8 / 2),
                      Text("list[index].subtitle!",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: secondaryTextStyle()),
                      SizedBox(height: Dimensions.height8 / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'list[index].amount!',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(
                              size: Dimensions.font14.toInt(),
                            ),
                          ),
                          SizedBox(width: Dimensions.height32),
                          Text(
                            'x1',
                            style: secondaryTextStyle(
                              size: Dimensions.font14.toInt(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          top: Dimensions.height8,
          left: Dimensions.width16,
          right: Dimensions.width16,
          bottom: Dimensions.height16,
        ),
        height: context.height() / 5.638,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          //color: context.cardColor,
          boxShadow: defaultBoxShadow(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height16),
            topRight: Radius.circular(Dimensions.height16),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: Dimensions.height16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2items', style: secondaryTextStyle()),
                Text('\$364.00', style: boldTextStyle()),
              ],
            ),
            SizedBox(height: Dimensions.height16),
            Button(
              context: context,
              onPressed: () {
                //SSBillingAddressScreen().launch(context);
                context.pushNamed(Routes.checkout);
              },
              title: 'Checkout',
            ),
          ],
        ),
      ),
    );
  }
}
