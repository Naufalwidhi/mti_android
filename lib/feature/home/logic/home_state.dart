part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.exception,
    this.model,
  });

  final HomeStatus status;
  final AppException? exception;
  final HomeModel? model;

  HomeState copyWith({
    HomeStatus? status,
    AppException? exception,
    HomeModel? model,
  }) {
    return HomeState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
        model,
      ];
}
