import 'package:flutter/material.dart';
import 'package:uiapp/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeeScreen(),
    );
  }
}

class CoffeeScreen extends StatelessWidget {
  const CoffeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/main.jpg', fit: BoxFit.cover),

          // dark overlay
          Container(color: Colors.black.withOpacity(0.45)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  " K-CAFÉ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 190, 130, 93),
                    fontSize: 40,
                    fontFamily: 'coffee',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Coffee fuels dreams,",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontFamily: 'coffee',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "awakens minds, and brightens gloomy mornings.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                    fontFamily: 'coffee',
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 40),

                // button
                SizedBox(
                  width: 200,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 152, 93, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 8,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Homepage()),
                      );
                    },

                    child: const Text(
                      "CHOOSE COFFEE",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'coffee',
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                const Text(
                  "App UI Assignment by Kiran Gull",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
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
