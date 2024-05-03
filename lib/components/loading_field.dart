import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OverflowLoadingPage extends StatelessWidget {
  const OverflowLoadingPage({
    required this.body,
    required this.visibility,
    super.key,
  });

  final Widget body;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        body,
        Visibility(
          visible: visibility,
          child: Container(
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
          ),
        ),
      ],
    );
  }
}
