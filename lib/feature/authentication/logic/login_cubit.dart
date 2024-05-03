import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:equatable/equatable.dart';
import 'package:mora_technical_test/constant/exception.dart';
import 'package:mora_technical_test/constant/helper.dart';
import 'package:mora_technical_test/feature/authentication/domain/services/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginService}) : super(const LoginState());

  final LoginServiceAbstract loginService;
  final MySharedPreferences sharedPreferences = MySharedPreferences();

  Future<void> login() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final response = await loginService.loginGoogle();
      sharedPreferences.setBool('isLogin', true);
      sharedPreferences.setBool('byGoogle', true);
      sharedPreferences.setString('email', response!.email!);
      emit(state.copyWith(
        status: LoginStatus.success,
        model: response,
      ));
    } on AppException catch (exception) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        exception: exception,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        exception: UnknownException(message: e.toString()),
      ));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(
      status: LoginStatus.initial,
      model: null,
    ));
  }
}
