import 'package:find_dates/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FindDates());
}

class FindDates extends StatelessWidget {
  const FindDates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 136, 177, 249),
      ),
      home: const SplashScreen(),
    );
  }
}
