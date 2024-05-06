import 'package:flutter/material.dart';
import 'package:tis_tos/domain/entities/video_post.dart';
import 'package:tis_tos/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  List<VideoPost> videosPost = [];
  bool initialLoading = true;
  final VideoPostRepository videosRepository;

  DiscoverProvider({required this.videosRepository});
  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 5));
    // List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoEntities())
    //     .toList();
    final newVideos = await videosRepository.getTrendingVideosByPage(1);
    videosPost.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
