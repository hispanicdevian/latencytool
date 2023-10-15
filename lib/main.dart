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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your App Name"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 400.0), // Add horizontal padding
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 1. Input box/area for the user to input an IP.
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Enter IP",
                  ),
                ),
                const SizedBox(height: 25.0),

                // 2. A row of 5 buttons.
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 5.0, // Adjust the spacing as needed
                  children: <Widget>[
                    for (int i = 0; i < 5; i++)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button functionality here.
                          },
                          child: Text("Button $i"),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 15.0),

                // 3. A header named "time".
                const Text(
                  "Time",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15.0),

                // 4. Below time, another Row of 4 buttons.
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 5.0, // Adjust the spacing as needed
                  children: <Widget>[
                    for (int i = 0; i < 4; i++)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add button functionality here.
                          },
                          child: Text("Button $i"),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8.0),

                // 5. A third row of 4 buttons with customizable horizontal spacing between them.
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 5.0, // Adjust the spacing as needed
                  children: <Widget>[
                    for (int i = 0; i < 4; i++)
                      ElevatedButton(
                        onPressed: () {
                          // Add button functionality here.
                        },
                        child: Text("Button $i"),
                      ),
                  ],
                ),

                const SizedBox(height: 20.0),

                // 6. A 4th row of 1 large button (fills maximum width).
                Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                  // Add button functionality here.
                },
                child: const Text("Start Tool"),
              ),
            ],
          ),
                const SizedBox(height: 20.0),

                // 7. Another large button named "Start".
                ElevatedButton(
                  onPressed: () {
                    // Add button functionality here.
                  },
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
