import 'package:code_challenge/level.dart';
import 'package:code_challenge/resource/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandscapeQuizScreen extends StatefulWidget {
  @override
  _LandscapeQuizScreenState createState() => _LandscapeQuizScreenState();
}

class _LandscapeQuizScreenState extends State<LandscapeQuizScreen> {
  int stars = 0; // Bintang yang diperoleh
  int elapsedTime = 0; // Waktu yang dihabiskan
  bool isAnswered = false;

  // Simulasi waktu (gunakan timer pada implementasi nyata)
  void startQuiz() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        elapsedTime = 4; // Ubah sesuai waktu yang dihabiskan
      });
    });
  }

  void checkAnswer(bool isCorrect) {
    if (isCorrect) {
      // Logika jumlah bintang berdasarkan waktu
      if (elapsedTime <= 5) {
        stars = 3;
      } else if (elapsedTime <= 10) {
        stars = 2;
      } else {
        stars = 1;
      }
      setState(() {
        isAnswered = true;
      });
      // Tampilkan dialog
      showResultDialog();
    }
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
                        // Logic untuk ke soal berikutnya
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

  @override
  void initState() {
    super.initState();
    startQuiz();

    // Kunci orientasi layar langsung ke landscape saat halaman ini dibuka
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);

    // // Menampilkan notifikasi di landscape
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Selamat datang di mode landscape!'),
    //       duration: Duration(seconds: 3),
    //     ),
    //   );
    // });
  }

  @override
  void dispose() {
    // Reset orientasi ke portrait saat keluar dari halaman ini
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
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
                // Bagian atas (level, waktu, bintang)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'LEVEL 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '00:10',
                        style: TextStyle(
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
                SizedBox(height: 20),
                // Bagian pertanyaan
                Container(
                  margin: EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: 0, // Menambahkan margin di atas
                    bottom: 0, // Menambahkan margin di bawah
                  ),
                  padding: EdgeInsets.only(
                    left: 150,
                    right: 100,
                    top: 100, // Menambahkan padding di atas
                    bottom: 100, // Menambahkan padding di bawah
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'if (0 > 10) Bagaimana Outputnya',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                // Bagian pilihan jawaban
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => checkAnswer(true), // Jawaban benar
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        'A. 10',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => checkAnswer(false), // Jawaban salah
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        'B. Salah',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => checkAnswer(false), // Jawaban salah
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        'B. Tai',
                        style: TextStyle(
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
                // Aksi untuk tombol "arrow back"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const levelPage()),
                );
              },
              icon: Image.asset(
                'assets/images/tombol_back.png', // Ganti dengan path gambar Anda
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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set orientasi aplikasi ke landscape saat aplikasi dijalankan
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MaterialApp(
      home: LandscapeQuizScreen(),
      debugShowCheckedModeBanner: false,
    ));
  });
}
