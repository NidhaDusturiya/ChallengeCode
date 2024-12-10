import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class logout_dialog extends StatelessWidget {
  const logout_dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 50,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff3F3E52), Color(0xffFF0061)],
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Konfirmasi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Apakah anda ingin keluar dari aplikasi?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Color(0xffFF0061),
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    "Tidak",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffff0061),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "iya",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
