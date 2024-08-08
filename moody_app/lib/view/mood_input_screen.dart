import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moody_app/model/mood_model.dart';
import 'package:moody_app/view/mood_screen.dart';

class MoodInputScreen extends StatefulWidget {
  const MoodInputScreen({super.key});

  @override
  State<MoodInputScreen> createState() => _MoodInputScreenState();
}

class _MoodInputScreenState extends State<MoodInputScreen> {
  int? _value;
  

  void _submitMood() {
    if (_value != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MoodScreen(moods: [moods[_value!]]);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 121, 80).withOpacity(1),
      body: Padding(
        padding: EdgeInsets.only(
            left: 20, right: 20, top: heights * 0.1, bottom: heights * 0.03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.waving_hand,
                  size: 24,
                  color: Colors.amber,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Hey!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.imprima(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heights * 0.02,
            ),
            Center(
              child: Text(
                "WHATS YOUR MOOD TODAY ?",
                textAlign: TextAlign.center,
                style: GoogleFonts.imprima(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: heights * 0.01,
            ),
            Wrap(
              runSpacing: 5,
              spacing: 5,
              children: List.generate(
                moods.length,
                (int index) {
                  return ChoiceChip(
                    label: Text("${moods[index].mood}"),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    },
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    labelStyle: GoogleFonts.imprima(
                      color: _value == index ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    selectedColor: Colors.pink,
                  );
                },
              ).toList(),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _submitMood();
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
}
