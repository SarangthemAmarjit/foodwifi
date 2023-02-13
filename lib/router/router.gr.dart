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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../model/allbelowmodel.dart' as _i12;
import '../pages/allreviewpage.dart' as _i4;
import '../pages/cuisinespage.dart' as _i9;
import '../pages/detailspage.dart' as _i3;
import '../pages/homepage.dart' as _i1;
import '../pages/productpage.dart' as _i2;
import '../pages/searchrestuarent.dart' as _i5;
import '../pages/sortpage.dart' as _i7;
import '../pages/storetypePage.dart' as _i8;
import '../pages/topsearch.dart' as _i6;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
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
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    AllreviewRoute.name: (routeData) {
      final args = routeData.argsAs<AllreviewRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AllreviewPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    SearchRestuarentRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRestuarentRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SearchRestuarentPage(
          key: args.key,
          itemname: args.itemname,
          issearchfoud: args.issearchfoud,
          cuisinesId: args.cuisinesId,
          storetypeid: args.storetypeid,
          checkname: args.checkname,
          sortby: args.sortby,
          issortbypress: args.issortbypress,
          isreset: args.isreset,
        ),
      );
    },
    TopsearchRoute.name: (routeData) {
      final args = routeData.argsAs<TopsearchRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.TopsearchPage(
          key: args.key,
          searchname: args.searchname,
          issearchfoud: args.issearchfoud,
          itemname: args.itemname,
          cuisinesId: args.cuisinesId,
          storetypeid: args.storetypeid,
          checkname: args.checkname,
          sortby: args.sortby,
          iscomingfromsort: args.iscomingfromsort,
          isreset: args.isreset,
        ),
      );
    },
    SortRoute.name: (routeData) {
      final args = routeData.argsAs<SortRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.SortPage(
          key: args.key,
          title: args.title,
          itemname: args.itemname,
          checkname: args.checkname,
          cuisinesid: args.cuisinesid,
          storetypeid: args.storetypeid,
          selectedindexforsort: args.selectedindexforsort,
        ),
      );
    },
    StoreRoute.name: (routeData) {
      final args = routeData.argsAs<StoreRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.StorePage(
          key: args.key,
          title: args.title,
          itemname: args.itemname,
          checkname: args.checkname,
          cuisinesid: args.cuisinesid,
          storetypeid: args.storetypeid,
        ),
      );
    },
    CuisinesRoute.name: (routeData) {
      final args = routeData.argsAs<CuisinesRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.CuisinesPage(
          key: args.key,
          title: args.title,
          itemname: args.itemname,
          checkname: args.checkname,
          cuisinesid: args.cuisinesid,
          storetypeid: args.storetypeid,
        ),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i10.RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
        _i10.RouteConfig(
          ProductDetailRoute.name,
          path: '/product-detail-page',
        ),
        _i10.RouteConfig(
          AllreviewRoute.name,
          path: '/allreview-page',
        ),
        _i10.RouteConfig(
          SearchRestuarentRoute.name,
          path: '/restuarentpage',
        ),
        _i10.RouteConfig(
          TopsearchRoute.name,
          path: '/topsearch-page',
        ),
        _i10.RouteConfig(
          SortRoute.name,
          path: '/sort-page',
        ),
        _i10.RouteConfig(
          StoreRoute.name,
          path: '/store-page',
        ),
        _i10.RouteConfig(
          CuisinesRoute.name,
          path: '/cuisines-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProductPage]
class ProductRoute extends _i10.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i11.Key? key,
    required String id,
    required String itemname,
    required bool iscomingfromsearch,
    required int index,
    _i12.Product? product,
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

  final _i11.Key? key;

  final String id;

  final String itemname;

  final bool iscomingfromsearch;

  final int index;

  final _i12.Product? product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id, itemname: $itemname, iscomingfromsearch: $iscomingfromsearch, index: $index, product: $product}';
  }
}

/// generated route for
/// [_i3.ProductDetailPage]
class ProductDetailRoute extends _i10.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i11.Key? key,
    required _i12.Product product,
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

  final _i11.Key? key;

  final _i12.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i4.AllreviewPage]
class AllreviewRoute extends _i10.PageRouteInfo<AllreviewRouteArgs> {
  AllreviewRoute({
    _i11.Key? key,
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

  final _i11.Key? key;

  final String id;

  @override
  String toString() {
    return 'AllreviewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.SearchRestuarentPage]
class SearchRestuarentRoute
    extends _i10.PageRouteInfo<SearchRestuarentRouteArgs> {
  SearchRestuarentRoute({
    _i11.Key? key,
    required String itemname,
    required bool issearchfoud,
    required String cuisinesId,
    required String storetypeid,
    required String checkname,
    required String sortby,
    required bool issortbypress,
    required bool isreset,
  }) : super(
          SearchRestuarentRoute.name,
          path: '/restuarentpage',
          args: SearchRestuarentRouteArgs(
            key: key,
            itemname: itemname,
            issearchfoud: issearchfoud,
            cuisinesId: cuisinesId,
            storetypeid: storetypeid,
            checkname: checkname,
            sortby: sortby,
            issortbypress: issortbypress,
            isreset: isreset,
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
    required this.sortby,
    required this.issortbypress,
    required this.isreset,
  });

  final _i11.Key? key;

  final String itemname;

  final bool issearchfoud;

  final String cuisinesId;

  final String storetypeid;

  final String checkname;

  final String sortby;

  final bool issortbypress;

  final bool isreset;

  @override
  String toString() {
    return 'SearchRestuarentRouteArgs{key: $key, itemname: $itemname, issearchfoud: $issearchfoud, cuisinesId: $cuisinesId, storetypeid: $storetypeid, checkname: $checkname, sortby: $sortby, issortbypress: $issortbypress, isreset: $isreset}';
  }
}

/// generated route for
/// [_i6.TopsearchPage]
class TopsearchRoute extends _i10.PageRouteInfo<TopsearchRouteArgs> {
  TopsearchRoute({
    _i11.Key? key,
    required String searchname,
    required bool issearchfoud,
    required String itemname,
    required String cuisinesId,
    required String storetypeid,
    required String checkname,
    String? sortby,
    required bool iscomingfromsort,
    required bool isreset,
  }) : super(
          TopsearchRoute.name,
          path: '/topsearch-page',
          args: TopsearchRouteArgs(
            key: key,
            searchname: searchname,
            issearchfoud: issearchfoud,
            itemname: itemname,
            cuisinesId: cuisinesId,
            storetypeid: storetypeid,
            checkname: checkname,
            sortby: sortby,
            iscomingfromsort: iscomingfromsort,
            isreset: isreset,
          ),
        );

  static const String name = 'TopsearchRoute';
}

class TopsearchRouteArgs {
  const TopsearchRouteArgs({
    this.key,
    required this.searchname,
    required this.issearchfoud,
    required this.itemname,
    required this.cuisinesId,
    required this.storetypeid,
    required this.checkname,
    this.sortby,
    required this.iscomingfromsort,
    required this.isreset,
  });

  final _i11.Key? key;

  final String searchname;

  final bool issearchfoud;

  final String itemname;

  final String cuisinesId;

  final String storetypeid;

  final String checkname;

  final String? sortby;

  final bool iscomingfromsort;

  final bool isreset;

  @override
  String toString() {
    return 'TopsearchRouteArgs{key: $key, searchname: $searchname, issearchfoud: $issearchfoud, itemname: $itemname, cuisinesId: $cuisinesId, storetypeid: $storetypeid, checkname: $checkname, sortby: $sortby, iscomingfromsort: $iscomingfromsort, isreset: $isreset}';
  }
}

/// generated route for
/// [_i7.SortPage]
class SortRoute extends _i10.PageRouteInfo<SortRouteArgs> {
  SortRoute({
    _i11.Key? key,
    required String title,
    required String itemname,
    required String checkname,
    required String cuisinesid,
    required String storetypeid,
    required String selectedindexforsort,
  }) : super(
          SortRoute.name,
          path: '/sort-page',
          args: SortRouteArgs(
            key: key,
            title: title,
            itemname: itemname,
            checkname: checkname,
            cuisinesid: cuisinesid,
            storetypeid: storetypeid,
            selectedindexforsort: selectedindexforsort,
          ),
        );

  static const String name = 'SortRoute';
}

class SortRouteArgs {
  const SortRouteArgs({
    this.key,
    required this.title,
    required this.itemname,
    required this.checkname,
    required this.cuisinesid,
    required this.storetypeid,
    required this.selectedindexforsort,
  });

  final _i11.Key? key;

  final String title;

  final String itemname;

  final String checkname;

  final String cuisinesid;

  final String storetypeid;

  final String selectedindexforsort;

  @override
  String toString() {
    return 'SortRouteArgs{key: $key, title: $title, itemname: $itemname, checkname: $checkname, cuisinesid: $cuisinesid, storetypeid: $storetypeid, selectedindexforsort: $selectedindexforsort}';
  }
}

/// generated route for
/// [_i8.StorePage]
class StoreRoute extends _i10.PageRouteInfo<StoreRouteArgs> {
  StoreRoute({
    _i11.Key? key,
    required String title,
    required String itemname,
    required String checkname,
    required String cuisinesid,
    required String storetypeid,
  }) : super(
          StoreRoute.name,
          path: '/store-page',
          args: StoreRouteArgs(
            key: key,
            title: title,
            itemname: itemname,
            checkname: checkname,
            cuisinesid: cuisinesid,
            storetypeid: storetypeid,
          ),
        );

  static const String name = 'StoreRoute';
}

class StoreRouteArgs {
  const StoreRouteArgs({
    this.key,
    required this.title,
    required this.itemname,
    required this.checkname,
    required this.cuisinesid,
    required this.storetypeid,
  });

  final _i11.Key? key;

  final String title;

  final String itemname;

  final String checkname;

  final String cuisinesid;

  final String storetypeid;

  @override
  String toString() {
    return 'StoreRouteArgs{key: $key, title: $title, itemname: $itemname, checkname: $checkname, cuisinesid: $cuisinesid, storetypeid: $storetypeid}';
  }
}

/// generated route for
/// [_i9.CuisinesPage]
class CuisinesRoute extends _i10.PageRouteInfo<CuisinesRouteArgs> {
  CuisinesRoute({
    _i11.Key? key,
    required String title,
    required String itemname,
    required String checkname,
    required String cuisinesid,
    required String storetypeid,
  }) : super(
          CuisinesRoute.name,
          path: '/cuisines-page',
          args: CuisinesRouteArgs(
            key: key,
            title: title,
            itemname: itemname,
            checkname: checkname,
            cuisinesid: cuisinesid,
            storetypeid: storetypeid,
          ),
        );

  static const String name = 'CuisinesRoute';
}

class CuisinesRouteArgs {
  const CuisinesRouteArgs({
    this.key,
    required this.title,
    required this.itemname,
    required this.checkname,
    required this.cuisinesid,
    required this.storetypeid,
  });

  final _i11.Key? key;

  final String title;

  final String itemname;

  final String checkname;

  final String cuisinesid;

  final String storetypeid;

  @override
  String toString() {
    return 'CuisinesRouteArgs{key: $key, title: $title, itemname: $itemname, checkname: $checkname, cuisinesid: $cuisinesid, storetypeid: $storetypeid}';
  }
}
