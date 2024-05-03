import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mora_technical_test/components/textfield.dart';
import 'package:mora_technical_test/constant/helper.dart';
import 'package:mora_technical_test/feature/authentication/logic/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscure = true;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  defaultSnackbar(String message) {
    showDefaultSnackbar(
      context,
      message,
    );
  }

  Widget fieldLoginSection() => Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 4),
            DefaultTextField(
              onTapOutside: (event) {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username tidak boleh kosong";
                }
                return null;
              },
              controller: emailController,
              isObscure: false,
              hintText: "relawan1@relawan.com",
            ),
            const SizedBox(height: 16),
            Text(
              "Password",
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 4),
            DefaultTextField(
              onTapOutside: (event) {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password tidak boleh kosong";
                }
                return null;
              },
              controller: passwordController,
              hintText: "* * * *",
              isObscure: isObscure,
              suffixWidget: IconButton(
                color: Colors.grey,
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: isObscure
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.remove_red_eye_outlined),
              ),
            ),
            const SizedBox(height: 48),
            isLoading
                ? const CircularProgressIndicator()
                : InkWell(
                    onTap: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      if (emailController.text.toString() ==
                              "moratel@gmail.com" &&
                          passwordController.text.toString() == "12345678") {
                        Navigator.pushReplacementNamed(context, "/");
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xff1FA0C9),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "or",
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff1FA0C9),
                ),
              ),
            ),
            const SizedBox(height: 10),
            isLoading
                ? const CircularProgressIndicator()
                : InkWell(
                    onTap: () {
                      context.read<LoginCubit>().login();
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xff1FA0C9),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/google_icon.png",
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Google",
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff1FA0C9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Login to Mora Telekomunikasi Indonesia",
                  style: GoogleFonts.inter(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff121212),
                  ),
                ),
                const SizedBox(height: 34),
                fieldLoginSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
