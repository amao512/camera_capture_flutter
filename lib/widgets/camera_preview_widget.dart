import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraPreviewWidget extends StatelessWidget {
  final CameraController cameraController;

  const CameraPreviewWidget({Key? key, required this.cameraController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CameraPreview(cameraController),
      ),
    );
  }
}