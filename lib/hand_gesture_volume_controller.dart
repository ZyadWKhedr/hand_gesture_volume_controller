library hand_gesture_volume_controller;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:volume_controller/volume_controller.dart';

class GestureVolumeController {
  final String serverUrl;
  double volumePercent = 0.0;

  GestureVolumeController({required this.serverUrl});

  Future<void> init() async {
    VolumeController.instance.showSystemUI = true;
  }

  Future<void> fetchVolume() async {
    try {
      final response = await http.get(Uri.parse(serverUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        volumePercent = data['volume_percent']?.toDouble() ?? 0.0;
        await VolumeController.instance.setVolume(volumePercent / 100);
      }
    } catch (e) {
      debugPrint('Error fetching volume: $e');
    }
  }
}
