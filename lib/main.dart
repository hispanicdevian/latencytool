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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your App Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add 20 padding to both sides
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch both columns vertically
          children: <Widget>[
            // Left column for IP input
            const Flexible(
              child: Padding(
                padding: EdgeInsets.all(20.0), // Add 20 padding to both sides
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter IP",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Vertical separator line
            Container(
              width: 0.5, // Set the desired width for the separator
              color: Colors.black, // Set the color of the separator
            ),

            // Right column for the rest of the UI
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20.0), // Add 20 padding to both sides
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

                        // Rest of your UI components can be added here
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
                          onPressed: () {
                            // Add button functionality here.
                          },
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
