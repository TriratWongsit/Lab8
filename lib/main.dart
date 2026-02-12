import 'package:flutter/material.dart';

// Import หน้าจอทั้งหมด
import 'screens/home_screen.dart';
import 'screens/named_route_demo.dart';
import 'screens/pass_args_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Lab8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo, // สีหลักของแอป
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      // กำหนด Route เริ่มต้น
      initialRoute: '/',
      // ตาราง Routing
      routes: {
        '/': (context) => const HomeScreen(),
        // Named Routes สำหรับข้อ 4 และ 5
        '/second': (context) => const NamedRouteDetail(),
        '/extractArguments': (context) => const ExtractArgumentsScreen(),
      },
    );
  }
}