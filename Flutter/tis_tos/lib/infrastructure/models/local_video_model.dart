import 'package:tis_tos/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;
  LocalVideoModel(
      {required this.name,
      required this.videoUrl,
      required this.likes,
      required this.views});
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
          name: json['name'],
          videoUrl: json['videoUrl'],
          likes: json['likes'] ?? 0,
          views: json['views'] ?? 0);

  Map<String, dynamic> toJson() =>
      {'name': name, 
      'videoUrl': videoUrl, 
      'likes': likes, 
      'views': views};

  VideoPost toVideoEntities() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views
    );
}
