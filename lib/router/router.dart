import 'package:auto_route/auto_route.dart';
import 'package:foodwifi/pages/allreviewpage.dart';
import 'package:foodwifi/pages/cuisinespage.dart';
import 'package:foodwifi/pages/detailspage.dart';
import 'package:foodwifi/pages/homepage.dart';

import 'package:foodwifi/pages/productpage.dart';
import 'package:foodwifi/pages/searchrestuarent.dart';
import 'package:foodwifi/pages/sortpage.dart';
import 'package:foodwifi/pages/splashscreen.dart';
import 'package:foodwifi/pages/storetypePage.dart';
import 'package:foodwifi/pages/topsearch.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: SplashPage, initial: true, path: '/splash'),
    AutoRoute(page: HomePage, path: '/home'),
    AutoRoute(
      page: ProductPage,
    ),
    AutoRoute(page: ProductDetailPage),
    AutoRoute(page: AllreviewPage),
    AutoRoute(page: SearchRestuarentPage, path: '/restuarentpage'),
    AutoRoute(page: TopsearchPage),
    AutoRoute(page: SortPage),
    AutoRoute(page: StorePage),
    AutoRoute(page: CuisinesPage),
  ],
)
class $AppRouter {}
