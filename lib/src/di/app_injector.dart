import 'package:ecommerce_admin_tut/src/bloc/admin_statistics/admin_statistics.dart';
import 'package:ecommerce_admin_tut/src/bloc/banner_item/banner_item.dart';
import 'package:ecommerce_admin_tut/src/bloc/choose_category/choose_category.dart';
import 'package:ecommerce_admin_tut/src/bloc/customer_analytics/customer_analytics_cubit.dart';
import 'package:ecommerce_admin_tut/src/bloc/main_categories/main_categories.dart';
import 'package:ecommerce_admin_tut/src/bloc/chart_choice/chart_choice.dart';
import 'package:ecommerce_admin_tut/src/bloc/customers/customers_cubit.dart';
import 'package:ecommerce_admin_tut/src/bloc/notifications/notifications_cubit.dart';
import 'package:ecommerce_admin_tut/src/bloc/main_category_item/main_category_item.dart';
import 'package:ecommerce_admin_tut/src/bloc/order_item/order_item.dart';
import 'package:ecommerce_admin_tut/src/bloc/order_status/order_status_cubit.dart';
import 'package:ecommerce_admin_tut/src/bloc/orders/orders.dart';
import 'package:ecommerce_admin_tut/src/bloc/products/products_cubit.dart';
import 'package:ecommerce_admin_tut/src/bloc/sub_category_item/sub_category_item.dart';
import 'package:ecommerce_admin_tut/src/bloc/sub_categories/sub_categories.dart';
import 'package:ecommerce_admin_tut/src/notifiers/banners_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/main_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/language_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/orders_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/products_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/sub_categories_notifier.dart';
import 'package:ecommerce_admin_tut/src/notifiers/select_banner_products_notifier.dart';
import 'package:ecommerce_admin_tut/src/repository/algolia_repository.dart';
import 'package:ecommerce_admin_tut/src/repository/firebase_storage_repository.dart';
import 'package:ecommerce_admin_tut/src/repository/firestore_repository.dart';
import 'package:ecommerce_admin_tut/src/bloc/banners/banners.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/add_new_main_category_screen.dart';
import 'package:ecommerce_admin_tut/src/bloc/product_item/product_item.dart';
import 'package:get_it/get_it.dart';


GetIt getItInstance = GetIt.I;

class AppInjector {
  static final AppInjector _singleton = AppInjector._internal();

  factory AppInjector() => _singleton;

  AppInjector._internal();

  // static T getItInstance<T>({String? instanceName, dynamic param1, dynamic param2}) =>
  //     _injector<T>(instanceName: instanceName, param1: param1, param2: param2);


  // static const String dealOfTheDay = "deal_of_the_day";
  // static const String topProducts = "top_products";
  // static const String onSale = "on_sale";



  static void create() {
    _initCubits();
    _initRepos();
    _initNotifiers();
  }


  static _initRepos() {
    getItInstance.registerFactory(() => FirestoreRepository());
    getItInstance.registerFactory(() => AlgoliaRepository());

  }

  static _initCubits() {
    getItInstance.registerFactory(() => CustomersCubit());
      getItInstance.registerFactory(() => MainCategoriesCubit());
      getItInstance.registerFactory(() => ProductsCubit());
      getItInstance.registerFactory(() => MainCategoryItemCubit());
      getItInstance.registerFactory(() => ProductItemCubit());
      getItInstance.registerFactory(() => OrdersCubit());
      getItInstance.registerFactory(() => NotificationsCubit());
      getItInstance.registerFactory(() => AdminStatisticsCubit());
      getItInstance.registerFactory(() => ChartChoiceCubit());
      getItInstance.registerFactory(() => OrderCubit());
      getItInstance.registerFactory(() => FirebaseStorageRepository());
      getItInstance.registerFactory(() => OrderStatusCubit());
      getItInstance.registerFactory(() => CustomerAnalyticsCubit());
      getItInstance.registerFactory(() => ChooseCategoryCubit());
      getItInstance.registerFactory(() => BannerItemCubit());
      getItInstance.registerFactory(() => BannersCubit());
      getItInstance.registerFactory(() => SubCategoriesCubit());
      getItInstance.registerFactory(() => SubCategoryItemCubit());
      getItInstance.registerFactory(() => AddMainCategoryScreen());

  }

  static void _initNotifiers() {

    getItInstance.registerLazySingleton(() => MainCategoriesNotifier());
    getItInstance.registerLazySingleton(() => OrdersNotifier());
    getItInstance.registerLazySingleton(() => ProductsNotifier());
    getItInstance.registerLazySingleton(() => LanguageNotifier());
    getItInstance.registerLazySingleton(() => SubCategoriesNotifier());
    getItInstance.registerLazySingleton(() => BannersNotifier());
    getItInstance.registerLazySingleton(() => SelectBannerProductsNotifier());

  }
}
