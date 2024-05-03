import 'dart:convert';

class HomeModel {
  HomeModel({
    required this.data,
  });

  final List<HomeData> data;

  // This constructor parses a list directly from JSON string
  factory HomeModel.fromJson(String str) =>
      HomeModel.fromList(json.decode(str) as List<dynamic>);

  // Convert a list of maps to a list of HomeData
  factory HomeModel.fromList(List<dynamic> list) => HomeModel(
        data: list.map((x) => HomeData.fromMap(x)).toList(),
      );
}

class HomeData {
  HomeData({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  // Parses an individual item
  factory HomeData.fromJson(String str) => HomeData.fromMap(json.decode(str));

  factory HomeData.fromMap(Map<String, dynamic> json) => HomeData(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl'],
      );
}
