import 'package:flutter/material.dart';
import '../code_preview_scaffold.dart';

class ReturnDataDemo extends StatefulWidget {
  const ReturnDataDemo({super.key});
  @override
  State<ReturnDataDemo> createState() => _ReturnDataDemoState();
}

class _ReturnDataDemoState extends State<ReturnDataDemo> {
  String _message = 'Waiting for selection...';
  Color _statusColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return CodePreviewScaffold(
      title: 'Return Data',
      demoWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _statusColor),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _navigateAndDisplaySelection(context),
              child: const Text('Go to Selection Screen'),
            ),
          ],
        ),
      ),
      codeSnippet: '''
// 1. ใช้ await เพื่อรอค่าที่ส่งกลับมา (เป็น Future)
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const SelectionScreen()),
);

// 2. ที่หน้าปลายทาง ส่งค่ากลับผ่าน pop
Navigator.pop(context, 'Yep!');
// หรือ
Navigator.pop(context, 'Nope.');
''',
    );
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const _SelectionScreen()),
    );

    // ตรวจสอบว่า Widget ยังอยู่บนหน้าจอไหมก่อน setState
    if (!mounted) return;

    setState(() {
      if (result == 'Yep!') {
        _message = "User said: Yep! (Agreed)";
        _statusColor = Colors.green;
      } else if (result == 'Nope.') {
        _message = "User said: Nope. (Disagreed)";
        _statusColor = Colors.red;
      } else {
        _message = "User pressed back without selection";
        _statusColor = Colors.grey;
      }
    });
  }
}

class _SelectionScreen extends StatelessWidget {
  const _SelectionScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick an option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Do you like Flutter?", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text('Yep!'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  onPressed: () => Navigator.pop(context, 'Yep!'),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.close),
                  label: const Text('Nope.'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
                  onPressed: () => Navigator.pop(context, 'Nope.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}