import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobfair_task/core/errors/failures.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';
import 'package:jobfair_task/features/home/domain/usecases/get_product_usecase.dart';

import '../../../../../core/enums/screen_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetProductsUseCase getProductsUseCase;
  HomeBloc(this.getProductsUseCase) : super(HomeInitState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copWith(status: ScreenStatus.loading));

      var result = await getProductsUseCase();

      result.fold((l) {
        emit(state.copWith(status: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copWith(status: ScreenStatus.success, productsModel: r));
      });
    });
  }
}
