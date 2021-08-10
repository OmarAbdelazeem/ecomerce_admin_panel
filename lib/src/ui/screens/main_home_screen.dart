import 'package:ecommerce_admin_tut/src/core/utils/localization/localization_methods.dart';
import 'package:ecommerce_admin_tut/src/res/string_constants.dart';
import 'package:ecommerce_admin_tut/src/ui/common/app_bar.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/statistics_screen.dart';
import 'package:ecommerce_admin_tut/src/ui/screens/navigation_bar_screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'navigation_bar_screens/banners_screen.dart';
import 'navigation_bar_screens/main_categories_screen.dart';
import 'navigation_bar_screens/customers_screen.dart';
import 'navigation_bar_screens/orders_screen.dart';
import 'navigation_bar_screens/products_screen.dart';
import 'navigation_bar_screens/settings_screen.dart';

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  int appBarsIndex = 0;

  List<BaseAppBar>? _appBars;


  onItemTapped(int index) {
    setState(() {
      appBarsIndex = index;
    });
    pageController.jumpToPage(
      index,
    );
  }


  @override
  Widget build(BuildContext context) {
    _appBars = [
      BaseAppBar(
        StringsConstants.statistics,
      ),
      BaseAppBar(StringsConstants.customers,
          // searchType: SearchType.customer,
          passedContext: context),
      BaseAppBar(
        StringsConstants.products,
        // searchType: SearchType.product,
        // filterType: FilterType.products,
        passedContext: context,
      ),
      BaseAppBar(
        StringsConstants.categories,
      ),
      BaseAppBar(
        StringsConstants.notification,
      ),
      BaseAppBar(StringsConstants.orders,
          // searchType: SearchType.order,
        passedContext: context ,
        // filterType: FilterType.products,
      ),
      BaseAppBar(
        StringsConstants.banners,
      ),
      BaseAppBar(
        StringsConstants.settings,
      ),
    ];

    return Scaffold(
      appBar: _appBars![appBarsIndex],
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey[200]!,
                  offset: Offset(3, 5),
                  blurRadius: 17)
            ]),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.12,
            child: Container(
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.analytics),
                    onPressed: () {
                      onItemTapped(0);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.people),
                    onPressed: () {
                      onItemTapped(1);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      onItemTapped(2);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.category),
                    onPressed: () {
                      onItemTapped(3);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      onItemTapped(4);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.inbox_sharp),
                    onPressed: () {
                      onItemTapped(5);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.whatshot),
                    onPressed: () {
                      onItemTapped(6);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      onItemTapped(7);
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.88,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                StatisticsScreen(),
                CustomersScreen(),
                ProductsScreen(),
                MainCategoriesScreen(),
                NotificationsScreen(),
                OrdersScreen(),
                BannersScreen(),
                SettingsScreen(),
              ],
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
            ),
          )
        ],
      ),
    );
  }
}
