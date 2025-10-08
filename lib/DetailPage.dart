import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String itemName;

  const DetailPage({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2VhfGVufDB8fDB8fHww+for+$itemName',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'Ocean view for $itemName',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String resultMessage = '$itemName is marked as favorite.';
          Navigator.pop(context, resultMessage);
        },
        child: const Icon(Icons.favorite_border),
        tooltip: 'Mark as Favorite',
      ),
    );
  }
}