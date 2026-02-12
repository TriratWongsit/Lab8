import 'package:flutter/material.dart';

class CodePreviewScaffold extends StatelessWidget {
  final String title;
  final Widget demoWidget;
  final String codeSnippet;

  const CodePreviewScaffold({
    super.key,
    required this.title,
    required this.demoWidget,
    required this.codeSnippet,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          elevation: 2,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.amber,
            indicatorWeight: 3,
            tabs: [
              Tab(icon: Icon(Icons.touch_app), text: "UI Preview"),
              Tab(icon: Icon(Icons.code), text: "Source Code"),
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        body: TabBarView(
          children: [
            // ส่วนแสดงผลหน้าจอ (UI)
            Container(
              color: Colors.grey[50],
              child: Center(child: demoWidget),
            ),
            // ส่วนแสดงโค้ด (Code)
            Container(
              color: const Color(0xFF282C34), // สีพื้นหลังแบบ Dark Theme
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: SelectableText(
                  codeSnippet,
                  style: const TextStyle(
                    fontFamily: 'monospace', // ฟอนต์สำหรับโค้ด
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}