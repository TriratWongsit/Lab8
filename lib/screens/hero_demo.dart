import 'package:flutter/material.dart';
import '../code_preview_scaffold.dart';

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return CodePreviewScaffold(
      title: 'Hero Animation',
      demoWidget: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const _HeroDetail()),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Hero Widget (ต้นทาง)
              Hero(
                tag: 'flutter_logo_hero', // Tag ต้องตรงกัน
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))
                    ]
                  ),
                  child: const Icon(Icons.flutter_dash, color: Colors.white, size: 60),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Tap the icon to fly!", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
      codeSnippet: '''
// หน้าต้นทาง (Source)
Hero(
  tag: 'my-tag', // Tag ต้องเหมือนกันเป๊ะ
  child: Icon(Icons.person, size: 50),
)

// หน้าปลายทาง (Destination)
Hero(
  tag: 'my-tag',
  child: Icon(Icons.person, size: 150),
)
''',
    );
  }
}

class _HeroDetail extends StatelessWidget {
  const _HeroDetail();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(title: const Text("Hero Detail"), backgroundColor: Colors.indigo),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Hero(
            tag: 'flutter_logo_hero', // Tag เดียวกัน
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(150), // เปลี่ยนรูปร่างเป็นวงกลม
                boxShadow: const [
                  BoxShadow(color: Colors.black45, blurRadius: 20, offset: Offset(0, 10))
                ]
              ),
              child: const Icon(Icons.flutter_dash, color: Colors.white, size: 200),
            ),
          ),
        ),
      ),
    );
  }
}