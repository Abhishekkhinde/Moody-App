import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moody_app/model/mood_model.dart';
import 'package:moody_app/view/splash_screen.dart';
import 'package:video_player/video_player.dart';

class MoodScreen extends StatefulWidget {
  final List<MoodModel> moods;
  const MoodScreen({super.key, required this.moods});

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializedVideoPlayer;
  var sliderValue = moods.first.rating;

  @override
  void initState() {
    final mood = widget.moods.first;
    _controller = VideoPlayerController.asset("assets/${mood.video!}");
    _initializedVideoPlayer = _controller.initialize();
    _controller.play();
    sliderValue = mood.rating;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    final mood = widget.moods.first;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 121, 80).withOpacity(1),
      body: Padding(
        padding: EdgeInsets.only(
            top: heights * 0.03,
            left: widths * 0.02,
            right: widths * 0.02,
            bottom: heights * 0.03),
        child: Column(
          children: [
            Text(
              "You Are Filling ${mood.mood}",
              textAlign: TextAlign.center,
              style: GoogleFonts.imprima(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: heights * 0.03,
            ),
            FutureBuilder(
              future: _initializedVideoPlayer,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    width: widths,
                    height: heights * 0.3,
                    child: Center(
                      child: VideoPlayer(_controller),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: heights * 0.01,
            ),
            Text(
              "Rating",
              textAlign: TextAlign.center,
              style: GoogleFonts.imprima(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Slider(
                min: 0.0,
                max: 5.0,
                divisions: 5,
                // thumbColor: Colors.red,

                value: sliderValue,
                activeColor: Colors.amber,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
            ),
            Text(
              "${_sliderText(sliderValue)} : $sliderValue",
              style: GoogleFonts.imprima(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: heights * 0.02,
            ),
            Text(
              "${mood.description}",
              textAlign: TextAlign.center,
              style: GoogleFonts.imprima(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                widget.moods.first.rating = sliderValue;
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Your response has been submitted"),
                    ),
                  );
                });
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SplashScreen();
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
                  "Submit",
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

  String _sliderText(double value) {
    switch (value) {
      // case 0:
      //   return "poor";
      case 1:
        return "Fair";
      case 2:
        return "Good";
      case 3:
        return "Very Goog";
      case 4:
        return "Excellent";
      case 5:
        return "Outstanding";
      default:
        return "";
    }
  }
}
