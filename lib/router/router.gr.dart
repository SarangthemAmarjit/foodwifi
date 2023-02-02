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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../model/allbelowmodel.dart' as _i8;
import '../pages/allreviewpage.dart' as _i4;
import '../pages/detailspage.dart' as _i3;
import '../pages/homepage.dart' as _i1;
import '../pages/productpage.dart' as _i2;
import '../pages/searchrestuarent.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
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
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    AllreviewRoute.name: (routeData) {
      final args = routeData.argsAs<AllreviewRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AllreviewPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    SearchRestuarentRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRestuarentRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SearchRestuarentPage(
          key: args.key,
          itemname: args.itemname,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
        _i6.RouteConfig(
          ProductDetailRoute.name,
          path: '/product-detail-page',
        ),
        _i6.RouteConfig(
          AllreviewRoute.name,
          path: '/allreview-page',
        ),
        _i6.RouteConfig(
          SearchRestuarentRoute.name,
          path: '/search-restuarent-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProductPage]
class ProductRoute extends _i6.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i7.Key? key,
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

  final _i7.Key? key;

  final String id;

  final String itemname;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id, itemname: $itemname}';
  }
}

/// generated route for
/// [_i3.ProductDetailPage]
class ProductDetailRoute extends _i6.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i7.Key? key,
    required _i8.Product product,
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

  final _i7.Key? key;

  final _i8.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.AllreviewPage]
class AllreviewRoute extends _i6.PageRouteInfo<AllreviewRouteArgs> {
  AllreviewRoute({
    _i7.Key? key,
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

  final _i7.Key? key;

  final String id;

  @override
  String toString() {
    return 'AllreviewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.SearchRestuarentPage]
class SearchRestuarentRoute
    extends _i6.PageRouteInfo<SearchRestuarentRouteArgs> {
  SearchRestuarentRoute({
    _i7.Key? key,
    required String itemname,
  }) : super(
          SearchRestuarentRoute.name,
          path: '/search-restuarent-page',
          args: SearchRestuarentRouteArgs(
            key: key,
            itemname: itemname,
          ),
        );

  static const String name = 'SearchRestuarentRoute';
}

class SearchRestuarentRouteArgs {
  const SearchRestuarentRouteArgs({
    this.key,
    required this.itemname,
  });

  final _i7.Key? key;

  final String itemname;

  @override
  String toString() {
    return 'SearchRestuarentRouteArgs{key: $key, itemname: $itemname}';
  }
}
