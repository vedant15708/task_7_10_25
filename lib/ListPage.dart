import 'package:flutter/material.dart';
import 'DetailPage.dart';


class ListPage extends StatelessWidget {
  const ListPage({super.key});

  void _navigateToDetail(BuildContext context, String itemName) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(itemName: itemName),
      ),
    );

    if (result != null && context.mounted) {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.removeCurrentSnackBar();
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('$result')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = ['Sea 1', 'Sea 2', 'Sea 3'];


    return Scaffold(
      appBar: AppBar(
        title: const Text('Un-Named Routes',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final itemName = items[index];
          return ListTile(
            leading:  CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2VhfGVufDB8fDB8fHww'),
            ),
            title: Text(itemName),
            subtitle: Text('Ocean view for $itemName'),
            onTap: () => _navigateToDetail(context, itemName),
          );
        },
      ),
    );
  }
}