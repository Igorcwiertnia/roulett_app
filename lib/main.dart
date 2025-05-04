import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'screens/make_my_day_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roulette App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade900,
              Colors.deepPurple.shade700,
              Colors.deepPurple.shade500,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/logo.png', width: 120, height: 120),
              const SizedBox(height: 20),
              Text(
                'Roulette App',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildRouletteCard(
                      context,
                      'Make My Day',
                      Icons.calendar_today,
                      Colors.blue,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MakeMyDayScreen(),
                        ),
                      ),
                    ),
                    _buildRouletteCard(
                      context,
                      'Today Food',
                      Icons.restaurant,
                      Colors.orange,
                      () {
                        // TODO: Navigate to Today Food screen
                      },
                    ),
                    _buildRouletteCard(
                      context,
                      'Fun Time',
                      Icons.games,
                      Colors.green,
                      () {
                        // TODO: Navigate to Fun Time screen
                      },
                    ),
                    _buildRouletteCard(
                      context,
                      'My Music',
                      Icons.music_note,
                      Colors.pink,
                      () {
                        // TODO: Navigate to My Music screen
                      },
                    ),
                    _buildRouletteCard(
                      context,
                      'Adventure',
                      Icons.explore,
                      Colors.teal,
                      () {
                        // TODO: Navigate to Adventure screen
                      },
                    ),
                    _buildRouletteCard(
                      context,
                      'Outfit',
                      Icons.checkroom,
                      Colors.purple,
                      () {
                        // TODO: Navigate to Outfit screen
                      },
                    ),
                    _buildRouletteCard(
                      context,
                      'Workout',
                      Icons.fitness_center,
                      Colors.red,
                      () {
                        // TODO: Navigate to Workout screen
                      },
                    ),
                    _buildRouletteCard(
                      context,
                      'Hobby',
                      Icons.brush,
                      Colors.amber,
                      () {
                        // TODO: Navigate to Hobby screen
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRouletteCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassmorphicContainer(
        width: double.infinity,
        height: 150,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.bottomCenter,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.5),
            color.withOpacity(0.2),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}