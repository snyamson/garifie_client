part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const welcome = _Paths.welcome;
  static const signIn = _Paths.signIn;
  static const register = _Paths.register;
  static const home = _Paths.home;
  static const account = _Paths.account;
  static const cart = _Paths.cart;
  static const admin = _Paths.admin;
  static const product = _Paths.product;
  static const productDetail = _Paths.productDetail;
  static const checkout = _Paths.checkout;
  static const addProduct = _Paths.addProduct;
  static const banner = _Paths.banner;
  static const addBanner = _Paths.addBanner;
  static const arrival = _Paths.arrival;
  static const addArrival = _Paths.addArrival;
  static const orders = _Paths.orders;
  static const analytics = _Paths.analytics;
}

abstract class _Paths {
  static const welcome = '/welcome';
  static const signIn = '/sign-in';
  static const register = '/register';
  static const home = '/';
  static const account = '/account';
  static const cart = '/cart';
  static const admin = 'admin';
  static const product = 'product';
  static const productDetail = 'product-detail';
  static const checkout = 'checkout';
  static const addProduct = 'add-product';
  static const banner = 'banner';
  static const addBanner = 'add-banner';
  static const arrival = 'new-arrival';
  static const addArrival = 'add-arrival';
  static const orders = 'orders';
  static const analytics = 'analytics';
}
