import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';
import 'package:mora_technical_test/constant/exception.dart';
import 'package:mora_technical_test/constant/helper.dart';
import 'package:mora_technical_test/feature/home/domain/models/home_model.dart';
import 'package:mora_technical_test/feature/home/domain/services/home_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeService}) : super(const HomeState());

  final HomeServiceAbstract homeService;
  final MySharedPreferences sharedPreferences = MySharedPreferences();

  Future<void> home() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final response = await homeService.home();
      emit(state.copyWith(
        status: HomeStatus.success,
        model: response,
      ));
      print(response);
    } on AppException catch (exception) {
      print("APP Ex $exception");
      emit(state.copyWith(
        status: HomeStatus.failure,
        exception: exception,
      ));
    } catch (e) {
      print("Ex $e");

      emit(state.copyWith(
        status: HomeStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }
}
