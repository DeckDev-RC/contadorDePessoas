import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _people = 0;
  String _infoText = 'Pode Entrar!';

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = 'Mundo Invertido?!';
      } else if (_people <= 10) {
        _infoText = 'Pode Entrar!';
      } else {
        _infoText = 'Lotado';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
      home: Stack(
        children: [
          Image.asset(
            'assets/images/img.png',
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pessoas:$_people',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        _changePeople(1);
                      },
                      child: const Text(
                        '+1',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: const Text(
                        '-1',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                _infoText,
                style: const TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
