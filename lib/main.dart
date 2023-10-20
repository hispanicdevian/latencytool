import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latencytool/ping_result_screen.dart';
// Import the PingResultsScreen

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
  List<String> buttonNames = [
    '15 sec',
    '30 sec',
    '60 sec',
    '90 sec',
    '120 sec',
  ];

  List<String> buttonNames2 = [
    '30 min',
    '1 hr',
    '3 hr',
    '6 hr',
    '12 hr',
    '24 hr',
    '1 W',
    '2 W',
    '1 M',
  ];

  List<String> ipAddresses = [];
  List<String> pingResults = [];

  void startPing() async {
    for (final ipAddress in ipAddresses) {
      final ping = Ping(ipAddress, count: 5);

      // [Optional]
      // Preview command that will be run (helpful for debugging)
      if (kDebugMode) {
        print('Running command: ${ping.command}');
      }

      // Begin ping process and listen for output
      await for (final event in ping.stream) {
        if (kDebugMode) {
          print(event);
        }
        pingResults.add(event as String);
      }
    }

    // After pinging, navigate to the PingResultsScreen
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
                            if (index >= ipAddresses.length) {
                              ipAddresses.add(text);
                            } else {
                              ipAddresses[index] = text;
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Intervals",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15.0),
                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10.0,
                            runSpacing: 15.0,
                            children: [
                              for (int i = 0; i < buttonNames.length; i++)
                                ElevatedButton(
                                  onPressed: () {
                                    // Add button functionality here.
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(
                                        100,
                                        50,
                                      ),
                                    ),
                                  ),
                                  child: Text(buttonNames[i]),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Divider(
                          height: 20,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(height: 5.0),
                        const Text(
                          "Time",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15.0),
                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10.0,
                            runSpacing: 15.0,
                            children: [
                              for (int i = 0; i < buttonNames2.length; i++)
                                ElevatedButton(
                                  onPressed: () {
                                    // Add button functionality here.
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                                    minimumSize: MaterialStateProperty.all(
                                      const Size(
                                        100,
                                        50,
                                      ),
                                    ),
                                  ),
                                  child: Text(buttonNames2[i]),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Divider(
                          height: 20,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: startPing, // Start the ping process
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                            minimumSize: MaterialStateProperty.all(
                              const Size(
                                200,
                                50,
                              ),
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
