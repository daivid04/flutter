import 'package:tis_tos/domain/datasourse/video_post_datasource.dart';
import 'package:tis_tos/domain/entities/video_post.dart';
import 'package:tis_tos/domain/repositories/video_post_repository.dart';

class VideoPostsRepositoryImpl extends VideoPostRepository {
  final VideoPostDatasource videosDatasource;
  //Es para poder elegir cualquier tipo de datasource
  VideoPostsRepositoryImpl({required this.videosDatasource});
  @override
  Future<List<VideoPost>> getFavoriteVideosByPage(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) =>
      videosDatasource.getTrendingVideosByPage(page);
}
