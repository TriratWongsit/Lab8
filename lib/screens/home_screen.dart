import 'package:flutter/material.dart';
// Import หน้า Demo ทั้งหมด
import 'basic_nav_demo.dart';
import 'send_data_demo.dart';
import 'return_data_demo.dart';
import 'named_route_demo.dart';
import 'pass_args_demo.dart';
import 'hero_demo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final demos = [
      _DemoItem("1. Navigate to a new screen", "Push & Pop basics", Icons.arrow_forward, Colors.blue, const BasicNavDemo()),
      _DemoItem("2. Send data to a new screen", "Passing data via constructor", Icons.send, Colors.green, const SendDataDemo()),
      _DemoItem("3. Return data from a screen", "Pop with result", Icons.keyboard_return, Colors.orange, const ReturnDataDemo()),
      _DemoItem("4. Navigate with named routes", "Using routes table", Icons.map, Colors.purple, const NamedRouteDemo()),
      _DemoItem("5. Pass args to named route", "ModalRoute settings", Icons.settings_input_component, Colors.teal, const PassArgsDemo()),
      _DemoItem("6. Hero Animation", "Shared element transition", Icons.animation, Colors.red, const HeroDemo()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('LAB 8: Navigation Workshop')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final item = demos[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: item.color.withOpacity(0.1),
                child: Icon(item.icon, color: item.color),
              ),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(item.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.widget),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _DemoItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget widget;
  _DemoItem(this.title, this.subtitle, this.icon, this.color, this.widget);
}