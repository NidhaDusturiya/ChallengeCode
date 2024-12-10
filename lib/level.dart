import 'package:code_challenge/dialog/instruction_dialog.dart';
import 'package:code_challenge/dialog/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:code_challenge/resource/theme.dart';

class levelPage extends StatefulWidget {
  const levelPage({super.key});

  @override
  _levelPageState createState() => _levelPageState();
}

class _levelPageState extends State<levelPage> {
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _setLandscapeMode();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      _showInstructionDialog();
    }
    setState(() {
      _isFirstTime = isFirstTime;
    });
  }

  //dialog aturan permainan
  Future<void> _showInstructionDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext contex) {
        return InstructionDialog(
          onPressed: _setFirstTime,
        );
      },
    );
  }

  Future<void> _setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
  }

  void _showInstructionAgain() {
    _showInstructionDialog();
  }

  Future<void> _setLandscapeMode() async {
    //kode landscape
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  Future<void> _resetPortraitMode() async {
    // Kembalikan ke mode portrait sebelum keluar
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    _resetPortraitMode();
    super.dispose();
  }

  //perintah keluar
  Future<bool> _showExitConfirmationDialog() async {
    return await showDialog(
          context: context,
          builder: (context) => const logout_dialog(),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SELESAIKAN SEMUA LEVEL!'),
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: Color(0xFF28313B),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: _showInstructionAgain,
              color: Colors.white,
            ),
          ],
        ),
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
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 15),
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
                            debugPrint('Level ${index + 1} clicked');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: level_button,
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
      ),
    );
  }
}
