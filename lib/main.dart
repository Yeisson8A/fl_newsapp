import 'package:fl_newsapp/services/news_service.dart';
import 'package:fl_newsapp/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => NewsService())],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const TabsScreen(),
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
