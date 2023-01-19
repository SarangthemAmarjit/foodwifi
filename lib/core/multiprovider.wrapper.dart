import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logic/belowproduct/cubit/below_product_cubit_cubit.dart';
import 'package:foodwifi/logic/fetchdata/cubit/fetchdatabloc_cubit.dart';
import 'package:foodwifi/logic/upperproduct/cubit/upperproduct_cubit_cubit.dart';

class MultiproviderWrapper extends StatelessWidget {
  final Widget child;
  const MultiproviderWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => FetchdatablocCubit(),
      ),
      BlocProvider(
        create: (context) => UpperproductCubit(),
      ),
      BlocProvider(
        create: (context) => BelowProductCubitCubit(),
      ),
    ], child: child);
  }
}
