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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../model/allbelowmodel.dart' as _i13;
import '../pages/allreviewpage.dart' as _i5;
import '../pages/cuisinespage.dart' as _i10;
import '../pages/detailspage.dart' as _i4;
import '../pages/homepage.dart' as _i2;
import '../pages/productpage.dart' as _i3;
import '../pages/searchrestuarent.dart' as _i6;
import '../pages/sortpage.dart' as _i8;
import '../pages/splashscreen.dart' as _i1;
import '../pages/storetypePage.dart' as _i9;
import '../pages/topsearch.dart' as _i7;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductPage(
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
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    AllreviewRoute.name: (routeData) {
      final args = routeData.argsAs<AllreviewRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.AllreviewPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    SearchRestuarentRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRestuarentRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.SearchRestuarentPage(
          key: args.key,
          itemname: args.itemname,
          issearchfoud: args.issearchfoud,
          cuisinesId: args.cuisinesId,
          storetypeid: args.storetypeid,
          sortby: args.sortby,
          sortbyname: args.sortbyname,
          cuisinesname: args.cuisinesname,
          storetypename: args.storetypename,
          freedeliveryname: args.freedeliveryname,
          halalname: args.halalname,
          promoname: args.promoname,
          selectedindexforstoretype: args.selectedindexforstoretype,
          ischecked: args.ischecked,
          allcuisinese: args.allcuisinese,
          freedeliveryid: args.freedeliveryid,
          halalid: args.halalid,
          promoid: args.promoid,
        ),
      );
    },
    TopsearchRoute.name: (routeData) {
      final args = routeData.argsAs<TopsearchRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.TopsearchPage(
          key: args.key,
          searchname: args.searchname,
          issearchfoud: args.issearchfoud,
          itemname: args.itemname,
          cuisinesId: args.cuisinesId,
          storetypeid: args.storetypeid,
          sortby: args.sortby,
          sortbyname: args.sortbyname,
          cuisinesname: args.cuisinesname,
          storetypename: args.storetypename,
          freedeliveryname: args.freedeliveryname,
          halalname: args.halalname,
          promoname: args.promoname,
          iscomingfromsort: args.iscomingfromsort,
          selectedindexforstoretype: args.selectedindexforstoretype,
          ischecked: args.ischecked,
          allcuisines: args.allcuisines,
          freedeliveryid: args.freedeliveryid,
          halalid: args.halalid,
          promoid: args.promoid,
        ),
      );
    },
    SortRoute.name: (routeData) {
      final args = routeData.argsAs<SortRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.SortPage(
          key: args.key,
          title: args.title,
          itemname: args.itemname,
          cuisinesid: args.cuisinesid,
          storetypeid: args.storetypeid,
          selectedindexforsort: args.selectedindexforsort,
          sortbyname: args.sortbyname,
          cuisinesname: args.cuisinesname,
          storetypename: args.storetypename,
          freedeliveryname: args.freedeliveryname,
          halalname: args.halalname,
          promoname: args.promoname,
          allcuisines: args.allcuisines,
        ),
      );
    },
    StoreRoute.name: (routeData) {
      final args = routeData.argsAs<StoreRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.StorePage(
          key: args.key,
          title: args.title,
          itemname: args.itemname,
          cuisinesid: args.cuisinesid,
          storetypeid: args.storetypeid,
          sortbyname: args.sortbyname,
          cuisinesname: args.cuisinesname,
          storetypename: args.storetypename,
          freedeliveryname: args.freedeliveryname,
          halalname: args.halalname,
          promoname: args.promoname,
          selectedindexforstoretype: args.selectedindexforstoretype,
          storeidlist: args.storeidlist,
        ),
      );
    },
    CuisinesRoute.name: (routeData) {
      final args = routeData.argsAs<CuisinesRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.CuisinesPage(
          key: args.key,
          title: args.title,
          itemname: args.itemname,
          cuisinesid: args.cuisinesid,
          storetypeid: args.storetypeid,
          sortbyname: args.sortbyname,
          cuisinesname: args.cuisinesname,
          storetypename: args.storetypename,
          freedeliveryname: args.freedeliveryname,
          halalname: args.halalname,
          promoname: args.promoname,
          cuisinesitems: args.cuisinesitems,
          cuisinesidwithname: args.cuisinesidwithname,
        ),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i11.RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        _i11.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i11.RouteConfig(
          ProductRoute.name,
          path: '/product-page',
        ),
        _i11.RouteConfig(
          ProductDetailRoute.name,
          path: '/product-detail-page',
        ),
        _i11.RouteConfig(
          AllreviewRoute.name,
          path: '/allreview-page',
        ),
        _i11.RouteConfig(
          SearchRestuarentRoute.name,
          path: '/restuarentpage',
        ),
        _i11.RouteConfig(
          TopsearchRoute.name,
          path: '/topsearch-page',
        ),
        _i11.RouteConfig(
          SortRoute.name,
          path: '/sort-page',
        ),
        _i11.RouteConfig(
          StoreRoute.name,
          path: '/store-page',
        ),
        _i11.RouteConfig(
          CuisinesRoute.name,
          path: '/cuisines-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ProductPage]
class ProductRoute extends _i11.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i12.Key? key,
    required String id,
    required String itemname,
    required bool iscomingfromsearch,
    required int index,
    _i13.Product? product,
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

  final _i12.Key? key;

  final String id;

  final String itemname;

  final bool iscomingfromsearch;

  final int index;

  final _i13.Product? product;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, id: $id, itemname: $itemname, iscomingfromsearch: $iscomingfromsearch, index: $index, product: $product}';
  }
}

/// generated route for
/// [_i4.ProductDetailPage]
class ProductDetailRoute extends _i11.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i12.Key? key,
    required _i13.Product product,
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

  final _i12.Key? key;

  final _i13.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i5.AllreviewPage]
class AllreviewRoute extends _i11.PageRouteInfo<AllreviewRouteArgs> {
  AllreviewRoute({
    _i12.Key? key,
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

  final _i12.Key? key;

  final String id;

  @override
  String toString() {
    return 'AllreviewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.SearchRestuarentPage]
class SearchRestuarentRoute
    extends _i11.PageRouteInfo<SearchRestuarentRouteArgs> {
  SearchRestuarentRoute({
    _i12.Key? key,
    required String itemname,
    required bool issearchfoud,
    required String cuisinesId,
    required String storetypeid,
    required String sortby,
    required String sortbyname,
    required String cuisinesname,
    required String storetypename,
    required bool freedeliveryname,
    required bool halalname,
    required bool promoname,
    int? selectedindexforstoretype,
    required bool ischecked,
    required String allcuisinese,
    required String freedeliveryid,
    required String halalid,
    required String promoid,
  }) : super(
          SearchRestuarentRoute.name,
          path: '/restuarentpage',
          args: SearchRestuarentRouteArgs(
            key: key,
            itemname: itemname,
            issearchfoud: issearchfoud,
            cuisinesId: cuisinesId,
            storetypeid: storetypeid,
            sortby: sortby,
            sortbyname: sortbyname,
            cuisinesname: cuisinesname,
            storetypename: storetypename,
            freedeliveryname: freedeliveryname,
            halalname: halalname,
            promoname: promoname,
            selectedindexforstoretype: selectedindexforstoretype,
            ischecked: ischecked,
            allcuisinese: allcuisinese,
            freedeliveryid: freedeliveryid,
            halalid: halalid,
            promoid: promoid,
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
    required this.sortby,
    required this.sortbyname,
    required this.cuisinesname,
    required this.storetypename,
    required this.freedeliveryname,
    required this.halalname,
    required this.promoname,
    this.selectedindexforstoretype,
    required this.ischecked,
    required this.allcuisinese,
    required this.freedeliveryid,
    required this.halalid,
    required this.promoid,
  });

  final _i12.Key? key;

  final String itemname;

  final bool issearchfoud;

  final String cuisinesId;

  final String storetypeid;

  final String sortby;

  final String sortbyname;

  final String cuisinesname;

  final String storetypename;

  final bool freedeliveryname;

  final bool halalname;

  final bool promoname;

  final int? selectedindexforstoretype;

  final bool ischecked;

  final String allcuisinese;

  final String freedeliveryid;

  final String halalid;

  final String promoid;

  @override
  String toString() {
    return 'SearchRestuarentRouteArgs{key: $key, itemname: $itemname, issearchfoud: $issearchfoud, cuisinesId: $cuisinesId, storetypeid: $storetypeid, sortby: $sortby, sortbyname: $sortbyname, cuisinesname: $cuisinesname, storetypename: $storetypename, freedeliveryname: $freedeliveryname, halalname: $halalname, promoname: $promoname, selectedindexforstoretype: $selectedindexforstoretype, ischecked: $ischecked, allcuisinese: $allcuisinese, freedeliveryid: $freedeliveryid, halalid: $halalid, promoid: $promoid}';
  }
}

/// generated route for
/// [_i7.TopsearchPage]
class TopsearchRoute extends _i11.PageRouteInfo<TopsearchRouteArgs> {
  TopsearchRoute({
    _i12.Key? key,
    required String searchname,
    required bool issearchfoud,
    required String itemname,
    required String cuisinesId,
    required String storetypeid,
    String? sortby,
    required String sortbyname,
    required String cuisinesname,
    required String storetypename,
    required bool freedeliveryname,
    required bool halalname,
    required bool promoname,
    required bool iscomingfromsort,
    int? selectedindexforstoretype,
    required bool ischecked,
    required String allcuisines,
    required String freedeliveryid,
    required String halalid,
    required String promoid,
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
            sortby: sortby,
            sortbyname: sortbyname,
            cuisinesname: cuisinesname,
            storetypename: storetypename,
            freedeliveryname: freedeliveryname,
            halalname: halalname,
            promoname: promoname,
            iscomingfromsort: iscomingfromsort,
            selectedindexforstoretype: selectedindexforstoretype,
            ischecked: ischecked,
            allcuisines: allcuisines,
            freedeliveryid: freedeliveryid,
            halalid: halalid,
            promoid: promoid,
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
    this.sortby,
    required this.sortbyname,
    required this.cuisinesname,
    required this.storetypename,
    required this.freedeliveryname,
    required this.halalname,
    required this.promoname,
    required this.iscomingfromsort,
    this.selectedindexforstoretype,
    required this.ischecked,
    required this.allcuisines,
    required this.freedeliveryid,
    required this.halalid,
    required this.promoid,
  });

  final _i12.Key? key;

  final String searchname;

  final bool issearchfoud;

  final String itemname;

  final String cuisinesId;

  final String storetypeid;

  final String? sortby;

  final String sortbyname;

  final String cuisinesname;

  final String storetypename;

  final bool freedeliveryname;

  final bool halalname;

  final bool promoname;

  final bool iscomingfromsort;

  final int? selectedindexforstoretype;

  final bool ischecked;

  final String allcuisines;

  final String freedeliveryid;

  final String halalid;

  final String promoid;

  @override
  String toString() {
    return 'TopsearchRouteArgs{key: $key, searchname: $searchname, issearchfoud: $issearchfoud, itemname: $itemname, cuisinesId: $cuisinesId, storetypeid: $storetypeid, sortby: $sortby, sortbyname: $sortbyname, cuisinesname: $cuisinesname, storetypename: $storetypename, freedeliveryname: $freedeliveryname, halalname: $halalname, promoname: $promoname, iscomingfromsort: $iscomingfromsort, selectedindexforstoretype: $selectedindexforstoretype, ischecked: $ischecked, allcuisines: $allcuisines, freedeliveryid: $freedeliveryid, halalid: $halalid, promoid: $promoid}';
  }
}

/// generated route for
/// [_i8.SortPage]
class SortRoute extends _i11.PageRouteInfo<SortRouteArgs> {
  SortRoute({
    _i12.Key? key,
    required String title,
    required String itemname,
    required String cuisinesid,
    required String storetypeid,
    required String selectedindexforsort,
    required String sortbyname,
    required String cuisinesname,
    required String storetypename,
    required bool freedeliveryname,
    required bool halalname,
    required bool promoname,
    required String allcuisines,
  }) : super(
          SortRoute.name,
          path: '/sort-page',
          args: SortRouteArgs(
            key: key,
            title: title,
            itemname: itemname,
            cuisinesid: cuisinesid,
            storetypeid: storetypeid,
            selectedindexforsort: selectedindexforsort,
            sortbyname: sortbyname,
            cuisinesname: cuisinesname,
            storetypename: storetypename,
            freedeliveryname: freedeliveryname,
            halalname: halalname,
            promoname: promoname,
            allcuisines: allcuisines,
          ),
        );

  static const String name = 'SortRoute';
}

class SortRouteArgs {
  const SortRouteArgs({
    this.key,
    required this.title,
    required this.itemname,
    required this.cuisinesid,
    required this.storetypeid,
    required this.selectedindexforsort,
    required this.sortbyname,
    required this.cuisinesname,
    required this.storetypename,
    required this.freedeliveryname,
    required this.halalname,
    required this.promoname,
    required this.allcuisines,
  });

  final _i12.Key? key;

  final String title;

  final String itemname;

  final String cuisinesid;

  final String storetypeid;

  final String selectedindexforsort;

  final String sortbyname;

  final String cuisinesname;

  final String storetypename;

  final bool freedeliveryname;

  final bool halalname;

  final bool promoname;

  final String allcuisines;

  @override
  String toString() {
    return 'SortRouteArgs{key: $key, title: $title, itemname: $itemname, cuisinesid: $cuisinesid, storetypeid: $storetypeid, selectedindexforsort: $selectedindexforsort, sortbyname: $sortbyname, cuisinesname: $cuisinesname, storetypename: $storetypename, freedeliveryname: $freedeliveryname, halalname: $halalname, promoname: $promoname, allcuisines: $allcuisines}';
  }
}

/// generated route for
/// [_i9.StorePage]
class StoreRoute extends _i11.PageRouteInfo<StoreRouteArgs> {
  StoreRoute({
    _i12.Key? key,
    required String title,
    required String itemname,
    required String cuisinesid,
    required String storetypeid,
    required String sortbyname,
    required String cuisinesname,
    required String storetypename,
    required bool freedeliveryname,
    required bool halalname,
    required bool promoname,
    int? selectedindexforstoretype,
    required List<dynamic> storeidlist,
  }) : super(
          StoreRoute.name,
          path: '/store-page',
          args: StoreRouteArgs(
            key: key,
            title: title,
            itemname: itemname,
            cuisinesid: cuisinesid,
            storetypeid: storetypeid,
            sortbyname: sortbyname,
            cuisinesname: cuisinesname,
            storetypename: storetypename,
            freedeliveryname: freedeliveryname,
            halalname: halalname,
            promoname: promoname,
            selectedindexforstoretype: selectedindexforstoretype,
            storeidlist: storeidlist,
          ),
        );

  static const String name = 'StoreRoute';
}

class StoreRouteArgs {
  const StoreRouteArgs({
    this.key,
    required this.title,
    required this.itemname,
    required this.cuisinesid,
    required this.storetypeid,
    required this.sortbyname,
    required this.cuisinesname,
    required this.storetypename,
    required this.freedeliveryname,
    required this.halalname,
    required this.promoname,
    this.selectedindexforstoretype,
    required this.storeidlist,
  });

  final _i12.Key? key;

  final String title;

  final String itemname;

  final String cuisinesid;

  final String storetypeid;

  final String sortbyname;

  final String cuisinesname;

  final String storetypename;

  final bool freedeliveryname;

  final bool halalname;

  final bool promoname;

  final int? selectedindexforstoretype;

  final List<dynamic> storeidlist;

  @override
  String toString() {
    return 'StoreRouteArgs{key: $key, title: $title, itemname: $itemname, cuisinesid: $cuisinesid, storetypeid: $storetypeid, sortbyname: $sortbyname, cuisinesname: $cuisinesname, storetypename: $storetypename, freedeliveryname: $freedeliveryname, halalname: $halalname, promoname: $promoname, selectedindexforstoretype: $selectedindexforstoretype, storeidlist: $storeidlist}';
  }
}

/// generated route for
/// [_i10.CuisinesPage]
class CuisinesRoute extends _i11.PageRouteInfo<CuisinesRouteArgs> {
  CuisinesRoute({
    _i12.Key? key,
    required String title,
    required String itemname,
    required String cuisinesid,
    required String storetypeid,
    required String sortbyname,
    required String cuisinesname,
    required String storetypename,
    required bool freedeliveryname,
    required bool halalname,
    required bool promoname,
    required List<dynamic> cuisinesitems,
    required Map<dynamic, dynamic> cuisinesidwithname,
  }) : super(
          CuisinesRoute.name,
          path: '/cuisines-page',
          args: CuisinesRouteArgs(
            key: key,
            title: title,
            itemname: itemname,
            cuisinesid: cuisinesid,
            storetypeid: storetypeid,
            sortbyname: sortbyname,
            cuisinesname: cuisinesname,
            storetypename: storetypename,
            freedeliveryname: freedeliveryname,
            halalname: halalname,
            promoname: promoname,
            cuisinesitems: cuisinesitems,
            cuisinesidwithname: cuisinesidwithname,
          ),
        );

  static const String name = 'CuisinesRoute';
}

class CuisinesRouteArgs {
  const CuisinesRouteArgs({
    this.key,
    required this.title,
    required this.itemname,
    required this.cuisinesid,
    required this.storetypeid,
    required this.sortbyname,
    required this.cuisinesname,
    required this.storetypename,
    required this.freedeliveryname,
    required this.halalname,
    required this.promoname,
    required this.cuisinesitems,
    required this.cuisinesidwithname,
  });

  final _i12.Key? key;

  final String title;

  final String itemname;

  final String cuisinesid;

  final String storetypeid;

  final String sortbyname;

  final String cuisinesname;

  final String storetypename;

  final bool freedeliveryname;

  final bool halalname;

  final bool promoname;

  final List<dynamic> cuisinesitems;

  final Map<dynamic, dynamic> cuisinesidwithname;

  @override
  String toString() {
    return 'CuisinesRouteArgs{key: $key, title: $title, itemname: $itemname, cuisinesid: $cuisinesid, storetypeid: $storetypeid, sortbyname: $sortbyname, cuisinesname: $cuisinesname, storetypename: $storetypename, freedeliveryname: $freedeliveryname, halalname: $halalname, promoname: $promoname, cuisinesitems: $cuisinesitems, cuisinesidwithname: $cuisinesidwithname}';
  }
}
