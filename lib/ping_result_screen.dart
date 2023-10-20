import 'package:flutter/material.dart';

class PingResultsScreen extends StatelessWidget {
  final List<String> pingResults;

  const PingResultsScreen(this.pingResults, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ping Results"),
      ),
      body: ListView.builder(
        itemCount: pingResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pingResults[index]),
          );
        },
      ),
    );
  }
}
