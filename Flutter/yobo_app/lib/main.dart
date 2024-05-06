import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobo_app/config/theme/router/app_router.dart';
import 'package:yobo_app/config/theme/theme_data.dart';
import 'package:yobo_app/presentation/provider/provider_categories.dart';
import 'package:yobo_app/presentation/provider/provider_products.dart';
import 'package:yobo_app/presentation/provider/provider_user_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          final provider = ProviderCategories();
          provider.leadCategory();
          return provider;
        }),
        ChangeNotifierProvider(create: (_) {
          final provider = ProviderProducts();
          provider.leadProducts();
          provider.leadOpinions();
          return provider;
        }),
        ChangeNotifierProvider(create: (_) {
          final provider = ProviderUserData();
          provider.leadUserData();
          return provider;
        })
      ],
      child: MaterialApp.router(
        // routerConfig: appRouter,
        title: 'GA',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectColor: 1).getTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
