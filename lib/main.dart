import 'package:astronomy/app/presentation/screens/apod_today_screen.dart';
import 'package:astronomy/container_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  await setUpContainer();
  runApp(const AstronomyPicture());
}

class AstronomyPicture extends StatelessWidget {
  const AstronomyPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astronomy Picture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ApodTodayScreen(),
    );
  }
}