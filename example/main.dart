import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hand_gesture_volume_controller/hand_gesture_volume_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = GestureVolumeController(serverUrl: 'http://192.168.x.x:5000/volume-data');
  double volume = 0.0;

  @override
  void initState() {
    super.initState();
    controller.init();
    Timer.periodic(Duration(milliseconds: 300), (_) async {
      await controller.fetchVolume();
      setState(() => volume = controller.volumePercent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Hand Gesture Volume')),
        body: Center(
          child: Text(
            'Volume: ${volume.toInt()}%',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
