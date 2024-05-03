import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mora_technical_test/components/loading_field.dart';
import 'package:mora_technical_test/constant/helper.dart';
import 'package:mora_technical_test/feature/authentication/domain/services/login_service.dart';
import 'package:mora_technical_test/feature/authentication/logic/login_cubit.dart';
import 'package:mora_technical_test/feature/authentication/screen/login_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final MySharedPreferences preferences = MySharedPreferences();

  checkIsLoggedIn() async {
    bool isLogin = await preferences.getBool('isLogin');
    if (isLogin == true) {
      routeToAsessmentList();
    }
  }

  routeToAsessmentList() {
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  void initState() {
    checkIsLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(
        loginService: LoginService.create(),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            routeToAsessmentList();
          }
          if (state.status.isFailure) {
            showDefaultSnackbar(
              context,
              (state.exception?.message ?? "Unknown Error") == "Unauthorized"
                  ? "Username atau Password salah"
                  : (state.exception?.message ?? "Unknown Error"),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: OverflowLoadingPage(
              visibility: state.status.isLoading,
              body: const LoginView(),
            ),
          );
        },
      ),
    );
  }
}
