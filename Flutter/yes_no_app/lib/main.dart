import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_providers.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( //Para añadir varios provider en global
      providers: [ChangeNotifierProvider(create: (_)=>ChatProviders())], //Cuando no necesito el argumento puedo poner _
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(
          selectColor: 2
        ).theme(),
        home: const ChatScreen()
      ),
    );
  }
}