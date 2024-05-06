import 'package:tis_tos/domain/datasourse/video_post_datasource.dart';
import 'package:tis_tos/domain/entities/video_post.dart';
import 'package:tis_tos/infrastructure/models/local_video_model.dart';
import 'package:tis_tos/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByPage(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoEntities())
        .toList();
    return newVideos;
  }
}
