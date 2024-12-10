import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstructionDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const InstructionDialog({super.key, required this.onPressed});

  Future<void> _setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff3F3E52), Color(0xff00FFC8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Selamat datang di Quiz Pemrograman!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Tantang dirimu untuk menguji kemampuan pemrograman dalam waktu terbatas. Setiap level memiliki satu soal yang wajib diselesaikan. Soal yang berhasil dijawab dengan benar akan diberikan bintang sesuai dengan waktu yang Anda butuhkan untuk menyelesaikannya dan Anda dapat melanjutkan ke level berikutnya.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await _setFirstTime();
                  onPressed();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff3F3E52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
