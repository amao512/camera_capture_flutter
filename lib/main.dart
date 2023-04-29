import 'package:camera_capture_flutter/camera_capture_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Capture Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CameraCapturePage(),
    );
  }
}
