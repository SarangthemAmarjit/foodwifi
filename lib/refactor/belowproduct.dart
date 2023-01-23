// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodwifi/logic/belowproduct/cubit/below_product_cubit_cubit.dart';
// import 'package:foodwifi/model/belowproductmodel.dart';
// import 'package:foodwifi/refactor/productlist.dart';
// import 'package:foodwifi/refactor/reviewlistpage.dart';
// import 'package:foodwifi/refactor/vegonlylist.dart';

// class BelowProductPage extends StatelessWidget {
//   final List<Productbelowmodel?> allvegdatalist;
//   final List<Productbelowmodel?> allbelowdata;
//   final List<Productbelowmodel?> allbelowdataoneitem;
//   final bool isSwitched;
//   final String id;

//   const BelowProductPage(
//       {super.key,
//       required this.allvegdatalist,
//       required this.allbelowdata,
//       required this.allbelowdataoneitem,
//       required this.isSwitched,
//       required this.id});

//   @override
//   Widget build(BuildContext context) {
//     final allproductupperdata = context.watch<BelowProductCubitCubit>().state;
//     switch (allproductupperdata.status) {
//       case Status2.initial:
//         return Container();
//       case Status2.loading:
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       case Status2.loaded:
//         return isSwitched
//             ? Column(
//                 children: [
            
//                   VegetableonlyListPage(allvegdatalist: allvegdatalist),
//                 ],
//               )
//             : Column(
//                 children: [
//                   ProductListPage(allbelowdata: allbelowdataoneitem),
              
//                   ProductListPage(allbelowdata: allbelowdata),
//                 ],
//               );

//       case Status2.error:
//         return Container();
//     }
//   }
// }
