import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/carousel.dart';
import 'package:garifie_client/core/providers/current_product.dart';
import 'package:garifie_client/core/providers/product.dart';
import 'package:garifie_client/ui/pages/home/widgets/dots_indicator.dart';
import 'package:garifie_client/ui/shared/widgets/best_product_loader.dart';
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
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
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
                          : '10',
                    ),
                  );
                },
              ),
              error: (error, _) => SizedBox(
                  height: Dimensions.productItemHeight,
                  child: Center(child: Text(error.toString()))),
              loading: () => const BestProductLoader(),
            ),
            SizedBox(height: Dimensions.height16),
            // BEST OF GARI FIE END

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
            Responsive(
              mobile: ListView.separated(
                padding: EdgeInsets.only(
                  top: Dimensions.height16,
                  left: Dimensions.width16,
                  right: Dimensions.width16,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (_, __) => SizedBox(
                  height: Dimensions.height8,
                ),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      // SSProductScreen(img: img).launch(context!);
                    },
                    child: Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius10),
                          ),
                          child: Image(
                            image: const AssetImage(
                                'assets/images/strawberry_gari_banner.jpg'),
                            height: Dimensions.arrivalProductItemHeight,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: Dimensions.arrivalProductItemHeight,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius10),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: Dimensions.height8),
            // NEW ARRIVAL END
          ],
        ),
      ),
    );
  }
}
