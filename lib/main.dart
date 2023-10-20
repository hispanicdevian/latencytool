import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latencytool/ping_results_screen.dart';
import 'ping_results_screen.dart'; // Import the PingResultsScreen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> ipAddresses = [];
  List<String> pingResults = [];

  void startPing() async {
    for (final ipAddress in ipAddresses) {
      final ping = Ping(ipAddress, count: 5);

      // Begin ping process and listen for output
      await for (final event in ping.stream) {
        if (kDebugMode) {
          print(event);
        } // Optional: Print the ping results for debugging
        pingResults.add(event as String);
      }
    }

    // Navigate to the PingResultsScreen and pass the ping results
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PingResultsScreen(pingResults),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your App Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Left column for IP input
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int index = 0; index < ipAddresses.length; index++)
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter IP ${index + 1}",
                          ),
                          onChanged: (text) {
                            ipAddresses.add(text);
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // Vertical separator line
            Container(
              width: 0.5,
              color: Colors.black,
            ),

            // Right column for the rest of the UI
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Rest of your UI components
                        // ...

                        ElevatedButton(
                          onPressed: startPing, // Start the ping process
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                            minimumSize: MaterialStateProperty.all(
                              const Size(200, 50),
                            ),
                          ),
                          child: const Text("Start Tool"),
                        ),
                      ],
                    ),
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
