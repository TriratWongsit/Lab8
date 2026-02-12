import 'package:flutter/material.dart';
import '../code_preview_scaffold.dart';

// Class สำหรับเก็บข้อมูลที่จะส่ง
class ScreenArguments {
  final String title;
  final String message;
  ScreenArguments(this.title, this.message);
}

class PassArgsDemo extends StatelessWidget {
  const PassArgsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return CodePreviewScaffold(
      title: 'Pass Args (Named)',
      demoWidget: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.message),
          label: const Text('Send Message via Named Route'),
          onPressed: () {
            // ส่ง Arguments ไปพร้อมกับชื่อ Route
            Navigator.pushNamed(
              context,
              ExtractArgumentsScreen.routeName,
              arguments: ScreenArguments(
                'Secret Message',
                'Hello! This data was passed using Route Arguments.',
              ),
            );
          },
        ),
      ),
      codeSnippet: '''
// 1. สร้าง Class สำหรับเก็บ Arguments
class ScreenArguments {
  final String title;
  final String message;
  ScreenArguments(this.title, this.message);
}

// 2. ส่ง arguments ตอน pushNamed
Navigator.pushNamed(
  context,
  '/extractArguments',
  arguments: ScreenArguments('Title', 'Message'),
);

// 3. ดึง arguments ออกมาใช้ (ใน build method)
final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
''',
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key});
  // ชื่อ Route constant
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // ดึงค่า Arguments ที่ส่งมา
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(title: Text(args.title), backgroundColor: Colors.teal),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.teal),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.mail_outline, size: 50, color: Colors.teal),
              const SizedBox(height: 10),
              Text(args.message, style: const TextStyle(fontSize: 18), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}