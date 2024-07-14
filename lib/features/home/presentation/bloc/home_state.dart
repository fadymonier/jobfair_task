part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(RequestStatus.init) RequestStatus getProductsStatus,
    ProductModel? productModel,
    Failures? productFailure,
  }) = _HomeState;
}
