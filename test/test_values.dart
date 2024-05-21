import 'package:astronomy/app/core/failure.dart';
import 'package:astronomy/app/data/models/apod_model.dart';
import 'package:astronomy/app/domain/entities/apod.dart';

Apod Function() testApod = () => Apod(
  copyright: "Stefan Seip",
  date: DateTime.parse("2004-09-27"),
  explanation: "The Great Nebula in Orion is a colorful place.",
  mediaType: "image",
  serviceVersion: "v1",
  title: "The Great Nebula in Orion",
  url: "https://apod.nasa.gov/apod/image/0409/orion_seip.jpg",
  hdurl: "https://apod.nasa.gov/",
);

Failure Function() testNoConnection = () => NoConnection();

ApodModel Function() testApodModel = () => ApodModel(
  copyright: "Stefan Seip",
  date: DateTime.parse("2004-09-27"),
  explanation: "The Great Nebula in Orion is a colorful place.",
  mediaType: "image",
  serviceVersion: "v1",
  title: "The Great Nebula in Orion",
  url: "https://apod.nasa.gov/apod/image/0409/orion_seip.jpg",
  hdurl: "https://apod.nasa.gov/apod/image/0409/orion_seip_big.jpg",
);