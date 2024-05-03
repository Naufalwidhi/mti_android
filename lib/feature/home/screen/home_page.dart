import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mora_technical_test/feature/home/domain/services/home_service.dart';
import 'package:mora_technical_test/feature/home/logic/home_cubit.dart';
import 'package:mora_technical_test/feature/home/screen/home_card_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        homeService: HomeService.create(),
      )..home(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status.isSuccess) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < 15; i++)
                        HomeCardItem(
                          state.model?.data[i].albumId,
                          state.model?.data[i].id,
                          state.model?.data[i].title,
                          state.model?.data[i].url,
                          state.model?.data[i].thumbnailUrl,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state.status.isLoading) {
            return Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/loading.json",
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 72),
                      child: Text(
                        "Loading ....",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "${state.exception?.message}",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.lightBlue.shade200,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
