import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "$hours:$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(color: Color.fromARGB(255, 136, 177, 249)),
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 240, 226),
        appBar: AppBar(
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset("assets/images/date_find_logo.jpeg"),
          ),
          title: const Text('FalenDer'),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.blueGrey,
          child: SizedBox(
            child: Column(
              children: [
                const Text("date:"),
                Column(
                  children: [
                    const Text("Past"),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text("date"),
                            IconButton(
                              icon: const Icon(
                                Icons.access_alarm,
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Container(
                                    height: double.maxFinite,
                                    width: double.maxFinite,
                                    color: const Color.fromARGB(
                                        255, 194, 240, 226),
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            child: Column(
                                              children: const [
                                                Text(
                                                  "Past:\n",
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Text(
                                            "\nFuture:\n",
                                            style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("date"),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("date"),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("date"),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("Future"),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Text("date"),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("date"),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("date"),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("date"),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
