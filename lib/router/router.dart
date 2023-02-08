import 'package:auto_route/auto_route.dart';
import 'package:foodwifi/pages/allreviewpage.dart';
import 'package:foodwifi/pages/detailspage.dart';
import 'package:foodwifi/pages/homepage.dart';

import 'package:foodwifi/pages/productpage.dart';
import 'package:foodwifi/pages/searchrestuarent.dart';
import 'package:foodwifi/pages/topsearch.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: HomePage,
      initial: true,
    ),
    AutoRoute(
      page: ProductPage,
    ),
    AutoRoute(page: ProductDetailPage),
    AutoRoute(page: AllreviewPage),
    AutoRoute(page: SearchRestuarentPage),
    AutoRoute(page: TopsearchPage),
  ],
)
class $AppRouter {}
