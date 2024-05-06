import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tis_tos/config/theme/app_theme.dart';
import 'package:tis_tos/infrastructure/datasource/local_video_datasource_impl.dart';
import 'package:tis_tos/infrastructure/repository/video_post_repository_impl.dart';
import 'package:tis_tos/presentation/providers/discover_provider.dart';
import 'package:tis_tos/presentation/screens/discover/discover_screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasourceImpl());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            // lazy: false,
            //Esto lo que genera es que se ejecute el provider desde antes que se utilice, recomendado si sabes si el usuario si o si lo va a usar en el futuro
            create: (_) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage())
      ],
      child: MaterialApp(
        title: 'Tistos',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreens(),
      ),
    );
  }
}
