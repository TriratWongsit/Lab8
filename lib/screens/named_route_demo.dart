import 'package:flutter/material.dart';
import '../code_preview_scaffold.dart';

class NamedRouteDemo extends StatelessWidget {
  const NamedRouteDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return CodePreviewScaffold(
      title: 'Named Routes',
      demoWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.map, size: 80, color: Colors.purple),
            const SizedBox(height: 20),
            const Text("Start Screen", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
              onPressed: () {
                // เรียกใช้ Route ตามชื่อที่ตั้งไว้ใน main.dart
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Navigate to "/second"'),
            ),
          ],
        ),
      ),
      codeSnippet: '''
// 1. กำหนด routes ใน MaterialApp (ไฟล์ main.dart)
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const HomeScreen(),
    '/second': (context) => const NamedRouteDetail(),
  },
);

// 2. เรียกใช้ด้วย pushNamed
Navigator.pushNamed(context, '/second');
''',
    );
  }
}

class NamedRouteDetail extends StatelessWidget {
  const NamedRouteDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Named Route Screen"), backgroundColor: Colors.purple),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is /second route", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}