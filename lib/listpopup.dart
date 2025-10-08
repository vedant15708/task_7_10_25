import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListPopup(),
    );
  }
}

class ListPopup extends StatefulWidget {
  const ListPopup({super.key});

  @override
  State<ListPopup> createState() => _ListPopupState();
}

class _ListPopupState extends State<ListPopup> {
  final List<Map<String, dynamic>> categories = [
    {"color": Colors.orange, "name": "foo1"},
    {"color": Colors.green, "name": "foo2"},
    {"color": Colors.teal[900], "name": "foo3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popup Example"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCategoryPopup(context);
          },
          child: const Text("Show Categories"),
        ),
      ),
    );
  }

  void showCategoryPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: categories.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: item["color"],
                    ),
                    const SizedBox(width: 10),
                    Text(
                      item["name"],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
