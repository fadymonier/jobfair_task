// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

@immutable
class HomeState {
  ScreenStatus? status;

  ProductModel? productsModel;

  Failures? failures;

  HomeState({this.status, this.productsModel, this.failures});

  HomeState copWith(
      {ScreenStatus? status, ProductModel? productsModel, Failures? failures}) {
    return HomeState(
      status: status ?? this.status,
      failures: failures ?? this.failures,
      productsModel: productsModel ?? this.productsModel,
    );
  }
}

class HomeInitState extends HomeState {
  HomeInitState() : super(status: ScreenStatus.init);
}
