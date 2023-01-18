import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'below_product_cubit_state.dart';

class BelowProductCubitCubit extends Cubit<BelowProductCubitState> {
  BelowProductCubitCubit() : super(BelowProductCubitInitial());
}
