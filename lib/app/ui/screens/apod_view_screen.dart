import 'package:astronomy/assets/colors/custom_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../../domain/entities/apod.dart';

class ApodViewScreen extends StatefulWidget {
  final Apod apod;
  const ApodViewScreen({super.key, required this.apod});

  @override
  State<ApodViewScreen> createState() => _ApodViewScreenState();
}

class _ApodViewScreenState extends State<ApodViewScreen> {
  late Apod apod;

  @override
  void initState() {
    apod = widget.apod;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: CustomColors.white.withOpacity(0.0),
        automaticallyImplyLeading: false,
        title: const Text(
          "Today's image",
          style: TextStyle(
            fontFamily: 'Neometric',
          ),
        ),
        elevation: 0,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
            top: 100, // fazer safeare
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(apod.url ?? ""),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                apod.title ?? "",
                style: const TextStyle(
                  fontFamily: 'Neometric',
                  fontSize: 20,
                ),
              ),
              Text(
                apod.explanation ?? ",",
                style: TextStyle(
                  fontFamily: "Awesome",
                ),
              ),
              Text(
                "by ${apod.copyright ?? "Nasa"}",
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
