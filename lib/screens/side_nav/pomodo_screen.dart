import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  final _controller = CountDownController();
  final TextEditingController _numControl = TextEditingController();

  @override
  void dispose() {
    _numControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int duration = 10;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Study Time'),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text('Enter time in minutes'),
                        content: TextField(
                          controller: _numControl,
                          keyboardType: TextInputType.number,
                        ),
                        icon: const Icon(Icons.add_reaction),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                duration = int.parse(_numControl.text);
                                print(_numControl.text);
                              },
                              child: const Text('Ok')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'))
                        ],
                      );
                    }));
              },
              icon: const Icon(Icons.add_reaction),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularCountDownTimer(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              duration: duration,
              fillColor: Colors.grey,
              ringColor: Colors.purpleAccent,
              controller: _controller,
              strokeWidth: 20,
              strokeCap: StrokeCap.round,
              autoStart: false,
            ),
            const SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.start();
                    },
                    child: const Text('Start')),
                ElevatedButton(
                    onPressed: () {
                      _controller.pause();
                    },
                    child: const Text('Pause')),
                ElevatedButton(
                    onPressed: () {
                      _controller.resume();
                    },
                    child: const Text('Resume'))
              ],
            )
          ],
        ));
  }
}
