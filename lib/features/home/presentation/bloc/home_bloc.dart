import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobfair_task/core/enums/screen_status.dart';
import 'package:jobfair_task/core/errors/failures.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';
import 'package:jobfair_task/features/home/domain/usecases/get_product_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetProductsUseCase getProductsUseCase;

  HomeBloc({required this.getProductsUseCase}) : super(const HomeState()) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(getProductsStatus: RequestStatus.loading));

      var result = await getProductsUseCase.call();

      result.fold((l) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.failure, productFailure: l));
      }, (r) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.success, productModel: r));
      });
    });
  }
}
