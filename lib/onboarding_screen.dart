import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smooth_page_intro/intro_screens/intro_page.dart';
import 'package:smooth_page_intro/pages/home_page.dart';
import 'package:smooth_page_intro/themes/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // page controller to get to the page you are in rightly
  final PageController _controller = PageController();

  // keep track of it the user is on the last page or not
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = (index == 3);
                });
              },
              children: [
                IntroPage(
                  lottieAsset: 'assets/lottie/connect.json',
                  text: 'Welcome to ChatBee! Get ready to connect with like-minded individuals!',
                  color: brightBlue,
                ),
                IntroPage(
                  lottieAsset: 'assets/lottie/girl_connect.json',
                  text: 'Let\'s kickstart your journey to meaningful connections!',
                  color: brightRed,
                ),
                IntroPage(
                  lottieAsset: 'assets/lottie/chatBOT.json',
                  text: 'Let\'s dive in and explore the power of connection together! Let\'s make every chat count!',
                  color: brightGreen,
                ),
                IntroPage(
                  lottieAsset: 'assets/lottie/allhuman.json',
                  text: 'Let\'s make magic happen, one chat at a time!!!',
                  color: brightOrange,
                ),
              ],
            ),

            //dot controller
            Container(
              alignment: const Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //button to skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(3);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //dot indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                  ),

                  //next or done
                  isLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.symmetric(horizontal: 25.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white,
                            ),
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: const Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.symmetric(horizontal: 25.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white,
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
