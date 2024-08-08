import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moody_app/view/mood_input_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 121, 80).withOpacity(1),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: heights * 0.03),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Text(
                "Moody",
                style: GoogleFonts.imprima(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MoodInputScreen();
                  },
                ));
              },
              child: Container(
                height: heights * 0.06,
                width: widths,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.imprima(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
