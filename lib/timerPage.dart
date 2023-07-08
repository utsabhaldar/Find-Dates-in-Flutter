import 'package:flutter/material.dart';
import 'dart:async';

class TimerPage extends StatefulWidget {
  const TimerPage(int i, bool bool, {super.key});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _whiteTime = 600;
  int _blackTime = 600;
  bool _isWhiteTurn = true;
  bool _isRunning = false;
  bool _isBlackTurn = false;
  late Timer _timer;

  void _startStop() {
    setState(() {
      _isRunning = !_isRunning;
    });
    if (_isRunning) {
      _startTimer();
    } else {
      _stopTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _switchTurn();
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _reset() {
    setState(() {
      _whiteTime = 600;
      _blackTime = 600;
      _isWhiteTurn = true;
      _isRunning = false;
      _isBlackTurn = false;
      _timer.cancel();
    });
  }

  void _switchTurn() {
    setState(() {
      if (_isWhiteTurn) {
        _whiteTime--;
        if (_whiteTime == 0) {
          _isRunning = false;
          _timer.cancel();
        }
      } else {
        _blackTime--;
        if (_blackTime == 0) {
          _isRunning = false;
          _timer.cancel();
        }
      }
    });
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "$hours:$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  void _changeTime(int seconds, bool isWhite) {
    setState(() {
      if (isWhite) {
        _whiteTime = seconds;
      } else {
        _blackTime = seconds;
      }
    });
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
        appBar: AppBar(
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset("assets/images/date_find_logo.jpeg"),
          ),
          title: const Text('CHESS CLOCK TIMER'),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: InkWell(
                    onTap: () {
                      if (_isWhiteTurn) {
                        _isWhiteTurn = !_isWhiteTurn;
                        _isBlackTurn = !_isBlackTurn;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 194, 240, 226),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Text(
                          "\n     White:     \n      ${_formatTime(_whiteTime)}\n",
                          style: const TextStyle(
                              fontSize: 68.0,
                              color: Color.fromARGB(255, 0, 9, 7)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 1, 43, 56),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: _startStop,
                            icon: Icon(
                              _isRunning ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: _reset,
                            icon: const Icon(
                              Icons.lock_reset_rounded,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
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
                                              children: [
                                                const Text(
                                                  "White:\n",
                                                  style: TextStyle(
                                                    fontSize: 40,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                180, true),
                                                        child:
                                                            const Text("3 min"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                300, true),
                                                        child:
                                                            const Text("5 min"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                450, true),
                                                        child: const Text(
                                                            "7:30 min"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                600, true),
                                                        child: const Text(
                                                            "10 min"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                750, true),
                                                        child: const Text(
                                                            "12:30 min"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                900, true),
                                                        child: const Text(
                                                            "15 min"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                1200, true),
                                                        child: const Text(
                                                            "20 min"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                1500, true),
                                                        child: const Text(
                                                            "25 min"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                1800, true),
                                                        child: const Text(
                                                            "30 min"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Text(
                                            "\nBlack:\n",
                                            style: TextStyle(
                                              fontSize: 40,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                180, false),
                                                        child:
                                                            const Text("3 min"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                300, false),
                                                        child:
                                                            const Text("5 min"),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () =>
                                                            _changeTime(
                                                                450, false),
                                                        child: const Text(
                                                            "7:30 min"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          _changeTime(
                                                              600, false),
                                                      child:
                                                          const Text("10 min"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          _changeTime(
                                                              750, false),
                                                      child: const Text(
                                                          "12:30 min"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          _changeTime(
                                                              900, false),
                                                      child:
                                                          const Text("15 min"),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          _changeTime(
                                                              1200, false),
                                                      child:
                                                          const Text("20 min"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          _changeTime(
                                                              1500, false),
                                                      child:
                                                          const Text("25 min"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          _changeTime(
                                                              1800, false),
                                                      child:
                                                          const Text("30 min"),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.timer,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: InkWell(
                    // onTap: () {
                    //   if (_isBlackTurn) {
                    //     _isBlackTurn = false;
                    //     _isWhiteTurn = true;
                    //   }
                    // },
                    onTap: () {
                      if (_isBlackTurn) {
                        _isWhiteTurn = !_isWhiteTurn;
                        _isBlackTurn = !_isBlackTurn;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 194, 240, 226),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Text(
                          "\n     Black:     \n      ${_formatTime(_blackTime)}\n",
                          style: const TextStyle(
                              fontSize: 68.0,
                              color: Color.fromARGB(255, 9, 0, 0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
