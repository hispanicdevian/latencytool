import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> buttonNames = [
    '15 se',
    '30 se',
    '60 se',
    '90 se',
    '120 se',
  ];

  List<String> buttonNames2 = [
    '30 mi',
    '1 hr',
    '3 hr',
    '6 hr',
    '12 hr',
    '24 hr',
    '1 we',
    '2 we',
    '1 mo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your App Name"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400.0),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Enter IP",
                  ),
                ),
                const SizedBox(height: 10.0),

                const Text(
                  "Time",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15.0),

                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 10.0,
                  runSpacing: 15.0,
                  children: [
                    for (int i = 0; i < buttonNames.length; i++)
                      ElevatedButton(
                        onPressed: () {
                          // Add button functionality here.
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(
                              100, // Set the desired width
                              50,  // Set the desired height
                            ),
                          ),
                        ),
                        child: Text(buttonNames[i]),
                      ),
                  ],
                ),

                const SizedBox(height: 15.0),

                const Text(
                  "Intervals",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15.0),

                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 10.0,
                  runSpacing: 15.0,
                  children: [
                    for (int i = 0; i < buttonNames2.length; i++)
                      ElevatedButton(
                        onPressed: () {
                          // Add button functionality here.
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(
                              100, // Set the desired width
                              50,  // Set the desired height
                            ),
                          ),
                        ),
                        child: Text(buttonNames2[i]),
                      ),
                  ],
                ),

                const SizedBox(height: 15.0),

                ElevatedButton(
                  onPressed: () {
                    // Add button functionality here.
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(
                        200, // Set the desired width
                        50,  // Set the desired height
                      ),
                    ),
                  ),
                  child: const Text("Start Tool"),
                ),

                const SizedBox(height: 15.0),

                ElevatedButton(
                  onPressed: () {
                    // Add button functionality here.
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(
                        200, // Set the desired width
                        50,  // Set the desired height
                      ),
                    ),
                  ),
                  child: const Text("Start"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
