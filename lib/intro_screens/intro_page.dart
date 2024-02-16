import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  final String lottieAsset;
  final String text;
  final Color color;

  const IntroPage({
    super.key,
    required this.lottieAsset,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Lottie.asset(lottieAsset),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Text(
                          text,
                          style: GoogleFonts.dmSans(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
