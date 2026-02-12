import 'package:flutter/material.dart';
import '../code_preview_scaffold.dart';

class BasicNavDemo extends StatelessWidget {
  const BasicNavDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CodePreviewScaffold(
      title: 'Basic Navigation',
      demoWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home, size: 80, color: Colors.blue),
          const SizedBox(height: 20),
          const Text("Main Screen", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Go to Second Page'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const _BasicSecondPage()),
              );
            },
          ),
        ],
      ),
      codeSnippet: '''
// 1. จากหน้าแรก สั่ง Push ไปหน้าสอง
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondRoute()),
    );
  },
  child: const Text('Go to Second Page'),
)

// 2. จากหน้าสอง สั่ง Pop กลับมา
ElevatedButton(
  onPressed: () {
    Navigator.pop(context);
  },
  child: const Text('Go back!'),
)
''',
    );
  }
}

class _BasicSecondPage extends StatelessWidget {
  const _BasicSecondPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page"), backgroundColor: Colors.pink),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite, size: 80, color: Colors.pink),
            const SizedBox(height: 20),
            const Text("Welcome to Second Page!", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            FilledButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go back!'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}