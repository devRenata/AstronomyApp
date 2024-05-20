import 'package:astronomy/app/domain/entities/apod.dart';

class ApodModel extends Apod {
  const ApodModel({
    super.copyright,
    super.date,
    super.explanation,
    super.mediaType,
    super.serviceVersion,
    super.title,
    super.url,
    super.hdurl,
    super.thumbnailUrl,
  });

  factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
    copyright: json['copyright'] ?? "Nasa APOD",
    date: DateTime.parse(json['date']),
    explanation: json['explanation'],
    mediaType: json['media_type'],
    serviceVersion: json['service_version'],
    title: json['title'],
    url: json['url'],
    hdurl: json['hdurl'],
    thumbnailUrl: json['thumbnail_url'],
  );

  Map<String, dynamic> toJson() => {
    'copyright': copyright,
    'date': date.toString(),
    'explanation': explanation,
    'media_type': mediaType,
    'service_version': serviceVersion,
    'title': title,
    'url': url,
    'hdurl': hdurl,
    'thumbnail_url': thumbnailUrl,
  };
}