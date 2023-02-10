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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../model/allbelowmodel.dart' as _i10;
import '../pages/allreviewpage.dart' as _i4;
import '../pages/detailspage.dart' as _i3;
import '../pages/homepage.dart' as _i1;
import '../pages/productpage.dart' as _i2;
import '../pages/searchrestuarent.dart' as _i5;
import '../pages/sortpage.dart' as _i7;
import '../pages/topsearch.dart' as _i6;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ProductPage(
          key: args.key,
          id: args.id,
          itemname: args.itemname,
          iscomingfromsearch: args.iscomingfromsearch,
          index: args.index,
          product: args.product,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    AllreviewRoute.name: (routeData) {
      final args = routeData.argsAs<AllreviewRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AllreviewPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    SearchRestuarentRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRestuarentRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SearchRestuarentPage(
          key: args.key,
          itemname: args.itemname,
          issearchfoud: args.issearchfoud,
          cuisinesId: args.cuisinesId,
          storetypeid: args.storetypeid,
          checkname: args.checkname,
        ),
      );
    },
    TopsearchRoute.name: (routeData) {
      final args = routeData.argsAs<TopsearchRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.TopsearchPage(
          key: args.key,
          searchname: args.searchname,
        ),
      );
    },
    SortRoute.name: (routeData) {
      final args = routeData.argsAs<SortRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.SortPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
        _i8.RouteConfig(
          ProductDetailRoute.name,
          path: '/product-detail-page',
        ),
        _i8.RouteConfig(
          AllreviewRoute.name,
          path: '/allreview-page',
        ),
        _i8.RouteConfig(
          SearchRestuarentRoute.name,
          path: '/search-restuarent-page',
        ),
        _i8.RouteConfig(
          TopsearchRoute.name,
          path: '/topsearch-page',
        ),
        _i8.RouteConfig(
          SortRoute.name,
          path: '/sort-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProductPage]
class ProductRoute extends _i8.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i9.Key? key,
    required String id,
    required String itemname,
    required bool iscomingfromsearch,
    required int index,
    _i10.Product? product,
  }) : super(
          ProductRoute.name,
          path: '/product-page',
          args: ProductRouteArgs(
            key: key,
            id: id,
            itemname: itemname,
            iscomingfromsearch: iscomingfromsearch,
            index: index,
            product: product,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.id,
    required this.itemname,
    required this.iscomingfromsearch,
    required this.index,
    this.product,
  });

  final _i9.Key? key;

  final String id;

  final String itemname;

  final bool iscomingfromsearch;

  final int index;

  final _i10.Product? product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id, itemname: $itemname, iscomingfromsearch: $iscomingfromsearch, index: $index, product: $product}';
  }
}

/// generated route for
/// [_i3.ProductDetailPage]
class ProductDetailRoute extends _i8.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i9.Key? key,
    required _i10.Product product,
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

  final _i9.Key? key;

  final _i10.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.AllreviewPage]
class AllreviewRoute extends _i8.PageRouteInfo<AllreviewRouteArgs> {
  AllreviewRoute({
    _i9.Key? key,
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

  final _i9.Key? key;

  final String id;

  @override
  String toString() {
    return 'AllreviewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.SearchRestuarentPage]
class SearchRestuarentRoute
    extends _i8.PageRouteInfo<SearchRestuarentRouteArgs> {
  SearchRestuarentRoute({
    _i9.Key? key,
    required String itemname,
    required bool issearchfoud,
    required String cuisinesId,
    required String storetypeid,
    required String checkname,
  }) : super(
          SearchRestuarentRoute.name,
          path: '/search-restuarent-page',
          args: SearchRestuarentRouteArgs(
            key: key,
            itemname: itemname,
            issearchfoud: issearchfoud,
            cuisinesId: cuisinesId,
            storetypeid: storetypeid,
            checkname: checkname,
          ),
        );

  static const String name = 'SearchRestuarentRoute';
}

class SearchRestuarentRouteArgs {
  const SearchRestuarentRouteArgs({
    this.key,
    required this.itemname,
    required this.issearchfoud,
    required this.cuisinesId,
    required this.storetypeid,
    required this.checkname,
  });

  final _i9.Key? key;

  final String itemname;

  final bool issearchfoud;

  final String cuisinesId;

  final String storetypeid;

  final String checkname;

  @override
  String toString() {
    return 'SearchRestuarentRouteArgs{key: $key, itemname: $itemname, issearchfoud: $issearchfoud, cuisinesId: $cuisinesId, storetypeid: $storetypeid, checkname: $checkname}';
  }
}

/// generated route for
/// [_i6.TopsearchPage]
class TopsearchRoute extends _i8.PageRouteInfo<TopsearchRouteArgs> {
  TopsearchRoute({
    _i9.Key? key,
    required String searchname,
  }) : super(
          TopsearchRoute.name,
          path: '/topsearch-page',
          args: TopsearchRouteArgs(
            key: key,
            searchname: searchname,
          ),
        );

  static const String name = 'TopsearchRoute';
}

class TopsearchRouteArgs {
  const TopsearchRouteArgs({
    this.key,
    required this.searchname,
  });

  final _i9.Key? key;

  final String searchname;

  @override
  String toString() {
    return 'TopsearchRouteArgs{key: $key, searchname: $searchname}';
  }
}

/// generated route for
/// [_i7.SortPage]
class SortRoute extends _i8.PageRouteInfo<SortRouteArgs> {
  SortRoute({
    _i9.Key? key,
    required String title,
  }) : super(
          SortRoute.name,
          path: '/sort-page',
          args: SortRouteArgs(
            key: key,
            title: title,
          ),
        );

  static const String name = 'SortRoute';
}

class SortRouteArgs {
  const SortRouteArgs({
    this.key,
    required this.title,
  });

  final _i9.Key? key;

  final String title;

  @override
  String toString() {
    return 'SortRouteArgs{key: $key, title: $title}';
  }
}
