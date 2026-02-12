import 'package:flutter/material.dart';
import '../code_preview_scaffold.dart';

class SendDataDemo extends StatelessWidget {
  const SendDataDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (i) => 'Job Task #${i + 1}');

    return CodePreviewScaffold(
      title: 'Send Data via Constructor',
      demoWidget: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text("${index + 1}")),
              title: Text(items[index]),
              subtitle: const Text("Tap to view details"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _DetailScreen(todo: items[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      codeSnippet: '''
// 1. ส่งข้อมูล (String todo) ผ่าน Constructor
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(todo: items[index]),
  ),
);

// 2. รับข้อมูลที่หน้าปลายทาง
class DetailScreen extends StatelessWidget {
  final String todo; // ตัวแปรสำหรับรับค่า

  // บังคับให้ส่งค่ามาตอนสร้าง Object
  const DetailScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Text(todo); // นำไปใช้งาน
  }
}
''',
    );
  }
}

class _DetailScreen extends StatelessWidget {
  final String todo;
  const _DetailScreen({required this.todo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.work, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            Text('Details for: $todo', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}