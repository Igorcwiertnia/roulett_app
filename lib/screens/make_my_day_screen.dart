import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MakeMyDayScreen extends StatefulWidget {
  const MakeMyDayScreen({super.key});

  @override
  State<MakeMyDayScreen> createState() => _MakeMyDayScreenState();
}

class _MakeMyDayScreenState extends State<MakeMyDayScreen> {
  bool _isSpinning = false;
  String _selectedOption = '';

  final List<String> _dailyOptions = [
    'Zrób coś kreatywnego',
    'Naucz się czegoś nowego',
    'Zadzwoń do przyjaciela',
    'Zrób trening',
    'Przeczytaj książkę',
    'Zrób coś dla innych',
    'Zorganizuj spotkanie',
    'Zrób coś spontanicznego',
  ];

  void _spinRoulette() {
    setState(() {
      _isSpinning = true;
      _selectedOption = '';
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSpinning = false;
        _selectedOption = _dailyOptions[DateTime.now().millisecondsSinceEpoch % _dailyOptions.length];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade700,
              Colors.blue.shade500,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Make My Day',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png', width: 120, height: 120),
                      GlassmorphicContainer(
                        width: 300,
                        height: 300,
                        borderRadius: 20,
                        blur: 20,
                        alignment: Alignment.bottomCenter,
                        border: 2,
                        linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.05),
                          ],
                        ),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                          ],
                        ),
                        child: Center(
                          child: _isSpinning
                              ? const CircularProgressIndicator(color: Colors.white)
                              : _selectedOption.isEmpty
                                  ? Text(
                                      'Naciśnij przycisk,\naby wylosować wyzwanie',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      _selectedOption,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                        ),
                      ).animate(
                        onPlay: (controller) => controller.repeat(),
                      ).shimmer(
                        duration: const Duration(seconds: 2),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _isSpinning ? null : _spinRoulette,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          _isSpinning ? 'Losowanie...' : 'Losuj wyzwanie',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}