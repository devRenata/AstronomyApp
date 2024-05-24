import 'package:astronomy/app/ui/screens/apod_today_screen/widgets/button_hd.dart';
import 'package:astronomy/app/ui/screens/core/custom_app_bar.dart';
import 'package:astronomy/assets/colors/custom_colors.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/apod.dart';

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
        backgroundColor: CustomColors.blueDarker,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          color: CustomColors.white,
        ),
        automaticallyImplyLeading: false,
        title: const Text(
          "Today's image",
          style: TextStyle(
            fontFamily: 'Neometric',
            color: Colors.white,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: CustomColors.white,
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
            color: CustomColors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 100,
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
                "${apod.explanation}.",
                style: const TextStyle(
                  fontFamily: "Awesome",
                ),
              ),
              Text(
                "by ${apod.copyright ?? "Nasa"}",
              ),
              const SizedBox(height: 20),
              //buttonHd(),
            ],
          ),
        ),
      ),
    );
  }
}
