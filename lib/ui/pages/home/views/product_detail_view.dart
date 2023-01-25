import 'package:flutter/material.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/images/app_logo.png'),
          height: Dimensions.height32 - 2,
          width: Dimensions.width32 - 2,
          color: Colors.black,
          fit: BoxFit.cover,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        leading: InkWell(
          onTap: () {
            // go back
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        actions: [
          Icon(Icons.favorite_border, color: context.iconColor, size: 20)
              .paddingOnly(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
              child: Column(
                children: [
                  Image(
                    image: const AssetImage('assets/images/coconut_gari.jpg'),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Men's shoe",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: secondaryTextStyle()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Nike Air Vapormax Evo",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: boldTextStyle()),
                      Text("\$182",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: boldTextStyle()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("Available Sizes",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(size: 14)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin:
                            const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Text("US 7",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 12)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: const Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Text("US 8",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 12)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                              color: const Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Text("US 9",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 12)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                              color: const Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Text("US 10",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16, width: 16),
                  Text("Description",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle()),
                  const SizedBox(height: 8),
                  Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: secondaryTextStyle()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Button(
                context: context,
                title: 'Buy Now',
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                    ),
                    context: context,
                    builder: (_) {
                      //  return AddToCartBottomSheet();
                      return Container();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
