import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_intro/components/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 198, 145, 66),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 25.0,
              ),

              //shop name
              Text(
                "ChatBee",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 25.0,
              ),

              //icon
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset(
                  'assets/images/global_network.png',
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 25.0,
              ),
              //title
              Text(
                "ChatBee, the chatting network app",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 10.0,
              ),

              //subtitle
              Text(
                "Spare with others your thoughts!!!",
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 2,
                ),
              ),

              const SizedBox(
                height: 25.0,
              ),

              //button
              MyButton(
                text: "Get Started",
                onTap: () {
                  //we go from here to the menu page
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
