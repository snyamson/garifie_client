import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:garifie_client/core/providers/carousel.dart';
import 'package:garifie_client/core/providers/current_product.dart';
import 'package:garifie_client/core/providers/product.dart';
import 'package:garifie_client/ui/pages/home/widgets/dots_indicator.dart';
import 'package:garifie_client/ui/shared/widgets/product_item.dart';
import 'package:garifie_client/utils/routes/app_pages.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  List<String> carouselItems = [
    'assets/images/soya_gari_banner.jpg',
    'assets/images/coconut_gari_banner.jpg',
    'assets/images/strawberry_gari_banner.jpg',
    'assets/images/crispy_gari_banner.jpg',
    'assets/images/all_gari_banner.jpg'
  ];

  @override
  void initState() {
    super.initState();
    ref.read(productListProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productListProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(
          image: const AssetImage('assets/images/app_logo.png'),
          height: Dimensions.height32 - 2,
          width: Dimensions.width32 - 2,
          color: Colors.black,
          fit: BoxFit.cover,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // CAROUSEL START
            CarouselSlider.builder(
              carouselController: ref
                  .read(carouselNotifierProvider.notifier)
                  .carouselController,
              itemCount: carouselItems.length,
              itemBuilder: (_, index, __) {
                return Container(
                  margin: EdgeInsets.only(
                    left: context.height() / context.height(),
                    right: context.height() / context.height(),
                  ),
                  child: Image(
                    image: AssetImage(carouselItems[index]),
                    height: Dimensions.carouselImageHeight,
                    width: Dimensions.screenWidth,
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                height: Dimensions.carouselImageHeight,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeFactor: 0.16,
                onPageChanged: (index, _) {
                  ref
                      .read(carouselNotifierProvider.notifier)
                      .onItemChange(index);
                },
              ),
            ),
            SizedBox(height: Dimensions.height16),
            DotsIndicator(images: carouselItems),
            // CAROUSEL END
            // BEST OF GARI FIE START
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width16,
                bottom: Dimensions.height8 / 2,
                top: Dimensions.height16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Best of Gari Fie",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: boldTextStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height16),
            products.when(
              data: (data) => HorizontalList(
                padding: EdgeInsets.only(
                    left: Dimensions.width16, right: Dimensions.width16),
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                spacing: 8,
                itemBuilder: (_, index) {
                  final product = data[index];

                  return InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    enableFeedback: true,
                    onTap: () {
                      ref.read(currentProductNotifier.notifier).update(
                            (state) => state = product,
                          );
                      // ref
                      //   .read(currentProductVariantProvider.notifier)
//.update((state) => state = product.variant.first);
                      context.pushNamed(
                        Routes.productDetail,
                        extra: product,
                      );
                    },
                    child: ProductItem(
                      img: product.productImg,
                      title: product.name,
                      subtitle: product.description,
                      amount: product.variant.isNotEmpty
                          ? product.variant.first.amount.toString()
                          : 'Ghs 10.00',
                    ),
                  );
                },
              ),
              error: (error, _) => SizedBox(
                  height: Dimensions.productItemHeight,
                  child: Center(child: Text(error.toString()))),
              loading: () => SizedBox(
                height: Dimensions.productItemHeight,
                child: SpinKitDoubleBounce(
                  color: Colors.grey.withOpacity(0.01),
                  size: 48,
                ),
              ),
            ),

            SizedBox(height: Dimensions.height16),
            // BEST OF GARI FIE END
            //  PROMOTION START
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width16,
                right: Dimensions.width16,
              ),
              child: InkWell(
                onTap: () {
                  // SSProductScreen(img: img).launch(context!);
                },
                child: Stack(
                  children: [
                    Image(
                      image: const AssetImage(
                          'assets/images/strawberry_gari_banner.jpg'),
                      height: Dimensions.arrivalProductItemHeight,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: Dimensions.arrivalProductItemHeight,
                      decoration: const BoxDecoration(color: Colors.black12),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Dimensions.height8),
            //  PROMOTION END
            // NEW ARRIVAL START
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width16,
                bottom: Dimensions.height8 / 2,
                top: Dimensions.height16,
              ),
              child: Text(
                "New Arrivals",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Wrap(
                runSpacing: 16,
                spacing: 16,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      // Go to Details
                    },
                    child: const ProductItem(),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      // Go to Details
                    },
                    child: const ProductItem(),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      // Go to Details
                    },
                    child: const ProductItem(),
                  ),
                ],
              ),
            ),

            // NEW ARRIVAL END
          ],
        ),
      ),
    );
  }
}
