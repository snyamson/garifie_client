import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/carousel.dart';
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
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: Dimensions.width16,
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
            HorizontalList(
              padding: EdgeInsets.only(
                  left: Dimensions.width16, right: Dimensions.width16),
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              itemBuilder: (_, index) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                  enableFeedback: true,
                  onTap: () {
                    context.pushNamed(Routes.productDetail);
                  },
                  child: const ProductItem(),
                );
              },
            ),
            SizedBox(height: Dimensions.height16),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width16,
                bottom: Dimensions.height8,
              ),
              child: Text(
                "New Arrivals",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width16,
                bottom: Dimensions.height8,
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
          ],
        ),
      ),
    );
  }
}
