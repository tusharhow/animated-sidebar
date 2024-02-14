import 'package:flutter/material.dart';
import 'package:flutter_animated_sidebar/views/home_page.dart';
import 'package:provider/provider.dart';
import 'controller/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'iPay',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.isDarkMode
          ? ThemeData.dark(
              useMaterial3: true,
            )
          : ThemeData.light(
              useMaterial3: true,
            ),
      home: const HomePage(),
    );
  }
}
