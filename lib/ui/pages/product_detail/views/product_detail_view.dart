import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:garifie_client/core/providers/product.dart';
import 'package:garifie_client/ui/pages/product_detail/widgets/variety_badge.dart';
import 'package:garifie_client/ui/shared/widgets/button.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  final String productId;
  const ProductDetailView({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends ConsumerState<ProductDetailView> {
  int index = 0;
  final List<String> img = [
    'assets/images/coconut_gari.jpg',
    'assets/images/soya_gari.jpg',
    'assets/images/crispy_gari.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final productDetail = ref.watch(productDetailProvider(widget.productId));
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: const Color(0x00000000),
            width: context.height() / context.height(),
          ),
        ),
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
        actions: [
          Icon(
            Icons.favorite_border,
            color: context.iconColor,
            size: Dimensions.iconSize20,
          ).paddingOnly(right: Dimensions.width16),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: productDetail.when(
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(img[index]),
                      height: Dimensions.productDetailImageHeight + 10,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: Dimensions.height8,
                      left: Dimensions.width16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: img.map((e) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            radius: 8,
                            onTap: () {
                              setState(() {
                                index = img.indexOf(e);
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: context.cardColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: index == img.indexOf(e)
                                      ? Colors.red
                                      : Colors.transparent,
                                ),
                              ),
                              child: Image(
                                image: AssetImage(e.validate()),
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ).paddingRight(8);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.width16,
                  right: Dimensions.width16,
                  bottom: Dimensions.height16,
                  top: Dimensions.height16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Best of Gari Fie",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle()),
                    SizedBox(height: Dimensions.height8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text("Coconut Gari",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle()),
                        Text("Ghs 12.00",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Available In",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(size: 14),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        VarietyBadge(label: '400g'),
                        VarietyBadge(label: '600g'),
                        VarietyBadge(label: '1.2kg'),
                        VarietyBadge(label: '1.8kg'),
                      ],
                    ),
                    SizedBox(height: Dimensions.height16),
                    Text(
                      "Description",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(),
                    ),
                    SizedBox(height: Dimensions.height8),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: secondaryTextStyle()),
                    SizedBox(height: Dimensions.height16),
                    Text(
                      "Ingredients",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(),
                    ),
                    SizedBox(height: Dimensions.height8),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: secondaryTextStyle(),
                    ),
                    SizedBox(height: Dimensions.height16),
                    Text(
                      "Health Benefit",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(),
                    ),
                    SizedBox(height: Dimensions.height8),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: secondaryTextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          error: (error, _) => Container(
            child: Center(
              child: Text(error.toString()),
            ),
          ),
          loading: () => SizedBox(
            height: context.height() / 1.5,
            child: Center(
              child: SpinKitDoubleBounce(
                color: Colors.grey.withOpacity(0.01),
                size: 48,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Dimensions.height16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(Dimensions.radius10 - 2)),
              padding: EdgeInsets.all(Dimensions.radius10 - 2),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            SizedBox(width: Dimensions.width8),
            Expanded(
              child: Button(
                context: context,
                title: 'Buy Now',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
