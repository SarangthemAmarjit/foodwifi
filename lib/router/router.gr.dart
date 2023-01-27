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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../model/allbelowmodel.dart' as _i7;
import '../pages/allreviewpage.dart' as _i4;
import '../pages/detailspage.dart' as _i3;
import '../pages/homepage.dart' as _i1;
import '../pages/productpage.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ProductPage(
          key: args.key,
          id: args.id,
          itemname: args.itemname,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    AllreviewRoute.name: (routeData) {
      final args = routeData.argsAs<AllreviewRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AllreviewPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
        _i5.RouteConfig(
          ProductDetailRoute.name,
          path: '/product-detail-page',
        ),
        _i5.RouteConfig(
          AllreviewRoute.name,
          path: '/allreview-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProductPage]
class ProductRoute extends _i5.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i6.Key? key,
    required String id,
    required String itemname,
  }) : super(
          ProductRoute.name,
          path: '/product-page',
          args: ProductRouteArgs(
            key: key,
            id: id,
            itemname: itemname,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.id,
    required this.itemname,
  });

  final _i6.Key? key;

  final String id;

  final String itemname;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id, itemname: $itemname}';
  }
}

/// generated route for
/// [_i3.ProductDetailPage]
class ProductDetailRoute extends _i5.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i6.Key? key,
    required _i7.Product product,
  }) : super(
          ProductDetailRoute.name,
          path: '/product-detail-page',
          args: ProductDetailRouteArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.product,
  });

  final _i6.Key? key;

  final _i7.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.AllreviewPage]
class AllreviewRoute extends _i5.PageRouteInfo<AllreviewRouteArgs> {
  AllreviewRoute({
    _i6.Key? key,
    required String id,
  }) : super(
          AllreviewRoute.name,
          path: '/allreview-page',
          args: AllreviewRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'AllreviewRoute';
}

class AllreviewRouteArgs {
  const AllreviewRouteArgs({
    this.key,
    required this.id,
  });

  final _i6.Key? key;

  final String id;

  @override
  String toString() {
    return 'AllreviewRouteArgs{key: $key, id: $id}';
  }
}
