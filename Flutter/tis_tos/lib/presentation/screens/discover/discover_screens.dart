import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tis_tos/presentation/providers/discover_provider.dart';
import 'package:tis_tos/presentation/widgets/shared/video_scroll_view.dart';

class DiscoverScreens extends StatelessWidget {
  const DiscoverScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    return Scaffold(
      body: (discoverProvider.initialLoading) ? 
        const Center(child: CircularProgressIndicator(),) //pone un indicador circular 
        : VideoScrollView(videos: discoverProvider.videosPost,)
    );
  }
}
