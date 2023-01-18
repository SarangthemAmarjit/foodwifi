// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../pages/homepage.dart' as _i1;
import '../pages/productpage.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ProductRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.ProductPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProductPage]
class ProductRoute extends _i3.PageRouteInfo<void> {
  const ProductRoute()
      : super(
          ProductRoute.name,
          path: '/product-page',
        );

  static const String name = 'ProductRoute';
}
