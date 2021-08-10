import 'package:auto_route/annotations.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_main_category_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_banner_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_sub_category_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_product_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/add_product_category_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/banner_details_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/banner_products.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/bar_chart_graph_screen.dart';

import 'package:ecommerce_admin_tut/src/ui/screens/customer_analytics_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/customer_info_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/customer_orders_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/customer_profile_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/main_category_details_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/edit_product_field_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/filter_and_sort_orders_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/filter_and_sort_products_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/product_details_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/main_home_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/main_categories_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/customers_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/statistics_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/notifications_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/orders_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/products_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/settings_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/order_details_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/search_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/sub_category_details_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/selecting_products.dart';

@AdaptiveAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
  AutoRoute(page: MainHomeScreen, initial: true),
  AutoRoute(page: MainCategoriesScreen),
  AutoRoute(page: CustomersScreen),
  AutoRoute(page: StatisticsScreen),
  AutoRoute(page: NotificationsScreen),
  AutoRoute(page: OrdersScreen),
  AutoRoute(page: ProductsScreen),
  AutoRoute(page: SettingsScreen),
  AutoRoute(page: AddProductScreen),
  AutoRoute(page: BarChartGraphScreen),

  AutoRoute(page: CustomerAnalyticsScreen),
  AutoRoute(page: CustomerInfoScreen),
  AutoRoute(page: CustomerOrdersScreen),
  AutoRoute(page: CustomerProfileScreen),
  AutoRoute(page: MainCategoryDetailsScreen),
  AutoRoute(page: ProductDetailsScreen),

  AutoRoute(page: OrderDetailsScreen),
  AutoRoute(page: SearchScreen),
  // AutoRoute(page: SectionsFilterScreen),

  AutoRoute(page: BannerDetailsScreen),
  AutoRoute(page: FilterAndSortingOrdersScreen),
  AutoRoute(page: FilterAndSortingProductsScreen),
  AutoRoute(page: AddNewBannerScreen),
  AutoRoute(page: AddNewSubCategoryScreen),
  AutoRoute(page: AddMainCategoryScreen),

  AutoRoute(page: SubCategoryDetailsScreen),
  AutoRoute(page: SelectingProducts),
  AutoRoute(page: EditProductFieldScreen),

])
class $AppRouter {}
