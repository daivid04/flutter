import 'package:chat_app/presentation/provider/provider_chats.dart';
import 'package:chat_app/presentation/screen/chat/screen_chat.dart';
import 'package:chat_app/presentation/screen/header/screen_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [ChangeNotifierProvider(create:(_) => ProviderChats())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home:  const Scaffold(
          appBar: AppBarHeader(),
          body: ScreenChat(),
        ),
      ),
    );
  }
}
