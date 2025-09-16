import 'package:flutter/material.dart';
import 'package:post/providers/PostServcieProvider.dart';
import 'package:post/screens/postscreen.dart';
import 'package:post/screens/spashscreen.dart';
import 'package:post/services/JsonService.dart';
import 'package:post/services/sharedservice.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (_) => PostProvider(Jsonservice(), SharedService())..loadPosts(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Posts',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const SplashScreen(),
    );
  }
}
