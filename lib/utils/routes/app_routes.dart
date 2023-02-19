part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const welcome = _Paths.welcome;
  static const signIn = _Paths.signIn;
  static const dashboard = _Paths.dashboard;
  static const home = _Paths.home;
  static const deliveryAddress = _Paths.deliveryAddress;
  static const addNewAddress = _Paths.addNewAddress;
  static const cart = _Paths.cart;
  static const productDetail = _Paths.productDetail;
  static const checkout = _Paths.checkout;
  static const confirmOrder = _Paths.confirmOrder;
  static const settings = _Paths.settings;
  static const feedback = _Paths.feedback;
  static const myOrders = _Paths.myOrders;
}

abstract class _Paths {
  static const welcome = '/welcome';
  static const signIn = '/sign-in';
  static const dashboard = '/';
  static const home = '/home';
  static const deliveryAddress = '/deliveryAddress';
  static const addNewAddress = 'addNewAddress';
  static const cart = '/cart';
  static const productDetail = 'product-detail';
  static const checkout = 'checkout';
  static const confirmOrder = '/confirmOrder';
  static const settings = '/settings';
  static const feedback = '/feedback';
  static const myOrders = '/myOrders';
}
