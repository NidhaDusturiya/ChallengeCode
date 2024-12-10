import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class levelPage extends StatefulWidget {
  const levelPage({super.key});

  @override
  _levelPageState createState() => _levelPageState();
}

class _levelPageState extends State<levelPage> {
  @override
  void initState() {
    super.initState();
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF28313B), Color(0xFF485461)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Back button
          Positioned(
            bottom: 20,
            left: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.pink,
                size: 40,
              ),
            ),
          ),
          // Level buttons
          Center(
            child: Column(
              children: [
                // Tambahkan jarak di atas GridView
                const SizedBox(height: 50), // Jarak dari atas
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.5,
                    ),
                    padding: const EdgeInsets.all(20),
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        onPressed: () {
                          // Logika untuk tiap level
                          debugPrint('Level ${index + 1} clicked');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1CD1A1), // Warna tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Level ${index + 1}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
