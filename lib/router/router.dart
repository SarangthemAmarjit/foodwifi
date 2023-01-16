import 'package:auto_route/auto_route.dart';
import 'package:foodwifi/pages/homepage.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: HomePage,
      initial: true,
    ),
  ],
)
class $AppRouter {}
