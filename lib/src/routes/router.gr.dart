// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:ecommerce_admin_tut/src/models/banner_model.dart' as _i32;
import 'package:ecommerce_admin_tut/src/models/main_category_model.dart'
    as _i30;
import 'package:ecommerce_admin_tut/src/models/name_field_model.dart' as _i34;
import 'package:ecommerce_admin_tut/src/models/product_model.dart' as _i31;
import 'package:ecommerce_admin_tut/src/models/sub_category_model.dart' as _i33;
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_banner_screen.dart'
    as _i24;
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_main_category_screen.dart'
    as _i26;
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_product_screen.dart'
    as _i11;
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_sub_category_screen.dart'
    as _i25;
import 'package:ecommerce_admin_tut/src/ui/screens/banner_details_screen.dart'
    as _i21;
import 'package:ecommerce_admin_tut/src/ui/screens/bar_chart_graph_screen.dart'
    as _i12;
import 'package:ecommerce_admin_tut/src/ui/screens/customer_analytics_screen.dart'
    as _i13;
import 'package:ecommerce_admin_tut/src/ui/screens/customer_info_screen.dart'
    as _i14;
import 'package:ecommerce_admin_tut/src/ui/screens/customer_orders_screen.dart'
    as _i15;
import 'package:ecommerce_admin_tut/src/ui/screens/customer_profile_screen.dart'
    as _i16;
import 'package:ecommerce_admin_tut/src/ui/screens/edit_product_field_screen.dart'
    as _i29;
import 'package:ecommerce_admin_tut/src/ui/screens/filter_and_sort_orders_screen.dart'
    as _i22;
import 'package:ecommerce_admin_tut/src/ui/screens/filter_and_sort_products_screen.dart'
    as _i23;
import 'package:ecommerce_admin_tut/src/ui/screens/main_category_details_screen.dart'
    as _i17;
import 'package:ecommerce_admin_tut/src/ui/screens/main_home_screen.dart'
    as _i3;
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/customers_screen.dart'
    as _i5;
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/main_categories_screen.dart'
    as _i4;
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/notifications_screen.dart'
    as _i7;
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/orders_screen.dart'
    as _i8;
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/products_screen.dart'
    as _i9;
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/settings_screen.dart'
    as _i10;
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/statistics_screen.dart'
    as _i6;
import 'package:ecommerce_admin_tut/src/ui/screens/order_details_screen.dart'
    as _i19;
import 'package:ecommerce_admin_tut/src/ui/screens/product_details_screen.dart'
    as _i18;
import 'package:ecommerce_admin_tut/src/ui/screens/search_screen.dart' as _i20;
import 'package:ecommerce_admin_tut/src/ui/screens/selecting_products.dart'
    as _i28;
import 'package:ecommerce_admin_tut/src/ui/screens/sub_category_details_screen.dart'
    as _i27;
import 'package:flutter/material.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MainHomeScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.MainHomeScreen();
        }),
    MainCategoriesScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.MainCategoriesScreen();
        }),
    CustomersScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.CustomersScreen();
        }),
    StatisticsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.StatisticsScreen();
        }),
    NotificationsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.NotificationsScreen();
        }),
    OrdersScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.OrdersScreen();
        }),
    ProductsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i9.ProductsScreen();
        }),
    SettingsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i10.SettingsScreen();
        }),
    AddProductScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i11.AddProductScreen();
        }),
    BarChartGraphScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i12.BarChartGraphScreen();
        }),
    CustomerAnalyticsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CustomerAnalyticsScreenArgs>();
          return _i13.CustomerAnalyticsScreen(args.customerId);
        }),
    CustomerInfoScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CustomerInfoScreenArgs>();
          return _i14.CustomerInfoScreen(args.customerId);
        }),
    CustomerOrdersScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CustomerOrdersScreenArgs>();
          return _i15.CustomerOrdersScreen(args.id);
        }),
    CustomerProfileScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CustomerProfileScreenArgs>();
          return _i16.CustomerProfileScreen(args.customerId, args.customerName);
        }),
    MainCategoryDetailsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MainCategoryDetailsScreenArgs>();
          return _i17.MainCategoryDetailsScreen(args.mainCategory);
        }),
    ProductDetailsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ProductDetailsScreenArgs>();
          return _i18.ProductDetailsScreen(
              product: args.product, isEnglishLanguage: args.isEnglishLanguage);
        }),
    OrderDetailsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OrderDetailsScreenArgs>();
          return _i19.OrderDetailsScreen(args.orderId);
        }),
    SearchScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SearchScreenArgs>();
          return _i20.SearchScreen(args.screenTitle);
        }),
    BannerDetailsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<BannerDetailsScreenArgs>();
          return _i21.BannerDetailsScreen(
              banner: args.banner, isEnglish: args.isEnglish);
        }),
    FilterAndSortingOrdersScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i22.FilterAndSortingOrdersScreen();
        }),
    FilterAndSortingProductsScreen.name: (routeData) =>
        _i1.AdaptivePage<dynamic>(
            routeData: routeData,
            builder: (_) {
              return _i23.FilterAndSortingProductsScreen();
            }),
    AddNewBannerScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i24.AddNewBannerScreen();
        }),
    AddNewSubCategoryScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AddNewSubCategoryScreenArgs>();
          return _i25.AddNewSubCategoryScreen(
              mainCategoryId: args.mainCategoryId);
        }),
    AddMainCategoryScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i26.AddMainCategoryScreen();
        }),
    SubCategoryDetailsScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SubCategoryDetailsScreenArgs>();
          return _i27.SubCategoryDetailsScreen(args.subCategory);
        }),
    SelectingProducts.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SelectingProductsArgs>();
          return _i28.SelectingProducts(bannerName: args.bannerName);
        }),
    EditProductFieldScreen.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditProductFieldScreenArgs>();
          return _i29.EditProductFieldScreen(
              fieldName: args.fieldName, value: args.value);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MainHomeScreen.name, path: '/'),
        _i1.RouteConfig(MainCategoriesScreen.name,
            path: '/main-categories-screen'),
        _i1.RouteConfig(CustomersScreen.name, path: '/customers-screen'),
        _i1.RouteConfig(StatisticsScreen.name, path: '/statistics-screen'),
        _i1.RouteConfig(NotificationsScreen.name,
            path: '/notifications-screen'),
        _i1.RouteConfig(OrdersScreen.name, path: '/orders-screen'),
        _i1.RouteConfig(ProductsScreen.name, path: '/products-screen'),
        _i1.RouteConfig(SettingsScreen.name, path: '/settings-screen'),
        _i1.RouteConfig(AddProductScreen.name, path: '/add-product-screen'),
        _i1.RouteConfig(BarChartGraphScreen.name,
            path: '/bar-chart-graph-screen'),
        _i1.RouteConfig(CustomerAnalyticsScreen.name,
            path: '/customer-analytics-screen'),
        _i1.RouteConfig(CustomerInfoScreen.name, path: '/customer-info-screen'),
        _i1.RouteConfig(CustomerOrdersScreen.name,
            path: '/customer-orders-screen'),
        _i1.RouteConfig(CustomerProfileScreen.name,
            path: '/customer-profile-screen'),
        _i1.RouteConfig(MainCategoryDetailsScreen.name,
            path: '/main-category-details-screen'),
        _i1.RouteConfig(ProductDetailsScreen.name,
            path: '/product-details-screen'),
        _i1.RouteConfig(OrderDetailsScreen.name, path: '/order-details-screen'),
        _i1.RouteConfig(SearchScreen.name, path: '/search-screen'),
        _i1.RouteConfig(BannerDetailsScreen.name,
            path: '/banner-details-screen'),
        _i1.RouteConfig(FilterAndSortingOrdersScreen.name,
            path: '/filter-and-sorting-orders-screen'),
        _i1.RouteConfig(FilterAndSortingProductsScreen.name,
            path: '/filter-and-sorting-products-screen'),
        _i1.RouteConfig(AddNewBannerScreen.name,
            path: '/add-new-banner-screen'),
        _i1.RouteConfig(AddNewSubCategoryScreen.name,
            path: '/add-new-sub-category-screen'),
        _i1.RouteConfig(AddMainCategoryScreen.name,
            path: '/add-main-category-screen'),
        _i1.RouteConfig(SubCategoryDetailsScreen.name,
            path: '/sub-category-details-screen'),
        _i1.RouteConfig(SelectingProducts.name, path: '/selecting-products'),
        _i1.RouteConfig(EditProductFieldScreen.name,
            path: '/edit-product-field-screen')
      ];
}

class MainHomeScreen extends _i1.PageRouteInfo {
  const MainHomeScreen() : super(name, path: '/');

  static const String name = 'MainHomeScreen';
}

class MainCategoriesScreen extends _i1.PageRouteInfo {
  const MainCategoriesScreen() : super(name, path: '/main-categories-screen');

  static const String name = 'MainCategoriesScreen';
}

class CustomersScreen extends _i1.PageRouteInfo {
  const CustomersScreen() : super(name, path: '/customers-screen');

  static const String name = 'CustomersScreen';
}

class StatisticsScreen extends _i1.PageRouteInfo {
  const StatisticsScreen() : super(name, path: '/statistics-screen');

  static const String name = 'StatisticsScreen';
}

class NotificationsScreen extends _i1.PageRouteInfo {
  const NotificationsScreen() : super(name, path: '/notifications-screen');

  static const String name = 'NotificationsScreen';
}

class OrdersScreen extends _i1.PageRouteInfo {
  const OrdersScreen() : super(name, path: '/orders-screen');

  static const String name = 'OrdersScreen';
}

class ProductsScreen extends _i1.PageRouteInfo {
  const ProductsScreen() : super(name, path: '/products-screen');

  static const String name = 'ProductsScreen';
}

class SettingsScreen extends _i1.PageRouteInfo {
  const SettingsScreen() : super(name, path: '/settings-screen');

  static const String name = 'SettingsScreen';
}

class AddProductScreen extends _i1.PageRouteInfo {
  const AddProductScreen() : super(name, path: '/add-product-screen');

  static const String name = 'AddProductScreen';
}

class BarChartGraphScreen extends _i1.PageRouteInfo {
  const BarChartGraphScreen() : super(name, path: '/bar-chart-graph-screen');

  static const String name = 'BarChartGraphScreen';
}

class CustomerAnalyticsScreen
    extends _i1.PageRouteInfo<CustomerAnalyticsScreenArgs> {
  CustomerAnalyticsScreen({required String customerId})
      : super(name,
            path: '/customer-analytics-screen',
            args: CustomerAnalyticsScreenArgs(customerId: customerId));

  static const String name = 'CustomerAnalyticsScreen';
}

class CustomerAnalyticsScreenArgs {
  const CustomerAnalyticsScreenArgs({required this.customerId});

  final String customerId;
}

class CustomerInfoScreen extends _i1.PageRouteInfo<CustomerInfoScreenArgs> {
  CustomerInfoScreen({required String customerId})
      : super(name,
            path: '/customer-info-screen',
            args: CustomerInfoScreenArgs(customerId: customerId));

  static const String name = 'CustomerInfoScreen';
}

class CustomerInfoScreenArgs {
  const CustomerInfoScreenArgs({required this.customerId});

  final String customerId;
}

class CustomerOrdersScreen extends _i1.PageRouteInfo<CustomerOrdersScreenArgs> {
  CustomerOrdersScreen({required String id})
      : super(name,
            path: '/customer-orders-screen',
            args: CustomerOrdersScreenArgs(id: id));

  static const String name = 'CustomerOrdersScreen';
}

class CustomerOrdersScreenArgs {
  const CustomerOrdersScreenArgs({required this.id});

  final String id;
}

class CustomerProfileScreen
    extends _i1.PageRouteInfo<CustomerProfileScreenArgs> {
  CustomerProfileScreen(
      {required String customerId, required String customerName})
      : super(name,
            path: '/customer-profile-screen',
            args: CustomerProfileScreenArgs(
                customerId: customerId, customerName: customerName));

  static const String name = 'CustomerProfileScreen';
}

class CustomerProfileScreenArgs {
  const CustomerProfileScreenArgs(
      {required this.customerId, required this.customerName});

  final String customerId;

  final String customerName;
}

class MainCategoryDetailsScreen
    extends _i1.PageRouteInfo<MainCategoryDetailsScreenArgs> {
  MainCategoryDetailsScreen({required _i30.MainCategoryModel mainCategory})
      : super(name,
            path: '/main-category-details-screen',
            args: MainCategoryDetailsScreenArgs(mainCategory: mainCategory));

  static const String name = 'MainCategoryDetailsScreen';
}

class MainCategoryDetailsScreenArgs {
  const MainCategoryDetailsScreenArgs({required this.mainCategory});

  final _i30.MainCategoryModel mainCategory;
}

class ProductDetailsScreen extends _i1.PageRouteInfo<ProductDetailsScreenArgs> {
  ProductDetailsScreen(
      {required _i31.ProductModel product, required bool isEnglishLanguage})
      : super(name,
            path: '/product-details-screen',
            args: ProductDetailsScreenArgs(
                product: product, isEnglishLanguage: isEnglishLanguage));

  static const String name = 'ProductDetailsScreen';
}

class ProductDetailsScreenArgs {
  const ProductDetailsScreenArgs(
      {required this.product, required this.isEnglishLanguage});

  final _i31.ProductModel product;

  final bool isEnglishLanguage;
}

class OrderDetailsScreen extends _i1.PageRouteInfo<OrderDetailsScreenArgs> {
  OrderDetailsScreen({required String orderId})
      : super(name,
            path: '/order-details-screen',
            args: OrderDetailsScreenArgs(orderId: orderId));

  static const String name = 'OrderDetailsScreen';
}

class OrderDetailsScreenArgs {
  const OrderDetailsScreenArgs({required this.orderId});

  final String orderId;
}

class SearchScreen extends _i1.PageRouteInfo<SearchScreenArgs> {
  SearchScreen({required String? screenTitle})
      : super(name,
            path: '/search-screen',
            args: SearchScreenArgs(screenTitle: screenTitle));

  static const String name = 'SearchScreen';
}

class SearchScreenArgs {
  const SearchScreenArgs({required this.screenTitle});

  final String? screenTitle;
}

class BannerDetailsScreen extends _i1.PageRouteInfo<BannerDetailsScreenArgs> {
  BannerDetailsScreen(
      {required _i32.BannerModel banner, required bool isEnglish})
      : super(name,
            path: '/banner-details-screen',
            args:
                BannerDetailsScreenArgs(banner: banner, isEnglish: isEnglish));

  static const String name = 'BannerDetailsScreen';
}

class BannerDetailsScreenArgs {
  const BannerDetailsScreenArgs(
      {required this.banner, required this.isEnglish});

  final _i32.BannerModel banner;

  final bool isEnglish;
}

class FilterAndSortingOrdersScreen extends _i1.PageRouteInfo {
  const FilterAndSortingOrdersScreen()
      : super(name, path: '/filter-and-sorting-orders-screen');

  static const String name = 'FilterAndSortingOrdersScreen';
}

class FilterAndSortingProductsScreen extends _i1.PageRouteInfo {
  const FilterAndSortingProductsScreen()
      : super(name, path: '/filter-and-sorting-products-screen');

  static const String name = 'FilterAndSortingProductsScreen';
}

class AddNewBannerScreen extends _i1.PageRouteInfo {
  const AddNewBannerScreen() : super(name, path: '/add-new-banner-screen');

  static const String name = 'AddNewBannerScreen';
}

class AddNewSubCategoryScreen
    extends _i1.PageRouteInfo<AddNewSubCategoryScreenArgs> {
  AddNewSubCategoryScreen({required String mainCategoryId})
      : super(name,
            path: '/add-new-sub-category-screen',
            args: AddNewSubCategoryScreenArgs(mainCategoryId: mainCategoryId));

  static const String name = 'AddNewSubCategoryScreen';
}

class AddNewSubCategoryScreenArgs {
  const AddNewSubCategoryScreenArgs({required this.mainCategoryId});

  final String mainCategoryId;
}

class AddMainCategoryScreen extends _i1.PageRouteInfo {
  const AddMainCategoryScreen()
      : super(name, path: '/add-main-category-screen');

  static const String name = 'AddMainCategoryScreen';
}

class SubCategoryDetailsScreen
    extends _i1.PageRouteInfo<SubCategoryDetailsScreenArgs> {
  SubCategoryDetailsScreen({required _i33.SubCategoryModel subCategory})
      : super(name,
            path: '/sub-category-details-screen',
            args: SubCategoryDetailsScreenArgs(subCategory: subCategory));

  static const String name = 'SubCategoryDetailsScreen';
}

class SubCategoryDetailsScreenArgs {
  const SubCategoryDetailsScreenArgs({required this.subCategory});

  final _i33.SubCategoryModel subCategory;
}

class SelectingProducts extends _i1.PageRouteInfo<SelectingProductsArgs> {
  SelectingProducts({required _i34.NameField bannerName})
      : super(name,
            path: '/selecting-products',
            args: SelectingProductsArgs(bannerName: bannerName));

  static const String name = 'SelectingProducts';
}

class SelectingProductsArgs {
  const SelectingProductsArgs({required this.bannerName});

  final _i34.NameField bannerName;
}

class EditProductFieldScreen
    extends _i1.PageRouteInfo<EditProductFieldScreenArgs> {
  EditProductFieldScreen({required String fieldName, required String value})
      : super(name,
            path: '/edit-product-field-screen',
            args:
                EditProductFieldScreenArgs(fieldName: fieldName, value: value));

  static const String name = 'EditProductFieldScreen';
}

class EditProductFieldScreenArgs {
  const EditProductFieldScreenArgs(
      {required this.fieldName, required this.value});

  final String fieldName;

  final String value;
}
