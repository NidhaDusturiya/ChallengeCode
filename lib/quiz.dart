import 'dart:async';

import 'package:code_challenge/level.dart';
import 'package:code_challenge/resource/quiz_questions.dart';
import 'package:code_challenge/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LandscapeQuizScreen extends StatefulWidget {
  final int quizNumber;

  const LandscapeQuizScreen({super.key, required this.quizNumber});

  @override
  _LandscapeQuizScreenState createState() => _LandscapeQuizScreenState();
}

class _LandscapeQuizScreenState extends State<LandscapeQuizScreen> {
  int stars = 0;
  int duration = 30;
  bool isAnswered = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    // Start the timer
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (duration > 0) {
        setState(() {
          duration--;
        });
      } else {
        // Stop the timer when duration reaches 0
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  void showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [pink_logout, hitam_instruction],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Great!!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Kamu berhasil memperoleh $stars bintang',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                        (index) => Icon(
                      index < stars ? Icons.star : Icons.star_border,
                      color: index < stars ? Colors.yellow : Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void checkAnswer(bool isCorrect) {
    timer.cancel(); // Stop the timer when an answer is checked
    if (isCorrect) {
      if (duration > 20) {
        stars = 3;
      } else if (duration <= 20 && duration > 7) {
        stars = 2;
      } else {
        stars = 1;
      }
      setState(() {
        isAnswered = true;
      });
      showResultDialog();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.transparent,
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [pink_logout, hitam_instruction],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(20),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Salah!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Jawaban kamu salah, ulangi soal ini kembali',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [bg_level1, bg_level2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        'LEVEL ${widget.quizNumber}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        duration.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          3,
                          (index) => Icon(
                            index < stars ? Icons.star : Icons.star_border,
                            color: index < stars ? Colors.yellow : Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                // Bagian pertanyaan
                Container(
                  padding: const EdgeInsets.only(
                    left: 100,
                    right: 100,
                    top: 100, // Menambahkan padding di atas
                    bottom: 100, // Menambahkan padding di bawah
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.sizeOf(context).width / 1.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                        ),
                        child: Text(
                          Quiz.listQuestionAnswer[widget.quizNumber - 1]['code'],
                          style: GoogleFonts.inconsolata(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Center(
                        child: Text(
                          Quiz.listQuestionAnswer[widget.quizNumber - 1]['question'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => checkAnswer(Quiz.listQuestionAnswer[widget.quizNumber - 1]['answers'][0]['isCorrect']),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        Quiz.listQuestionAnswer[widget.quizNumber - 1]['answers'][0]['choice'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => checkAnswer(Quiz.listQuestionAnswer[widget.quizNumber - 1]['answers'][1]['isCorrect']),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        Quiz.listQuestionAnswer[widget.quizNumber - 1]['answers'][1]['choice'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => checkAnswer(Quiz.listQuestionAnswer[widget.quizNumber - 1]['answers'][2]['isCorrect']), // Jawaban salah
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        Quiz.listQuestionAnswer[widget.quizNumber - 1]['answers'][2]['choice'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const levelPage()),
                );
              },
              icon: Image.asset(
                'assets/images/tombol_back.png',
                width: 24,
                height: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}