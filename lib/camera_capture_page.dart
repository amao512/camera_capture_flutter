import 'package:camera/camera.dart';
import 'package:camera_capture_flutter/widgets/capture_button_widget.dart';
import 'package:camera_capture_flutter/widgets/circle_camera_widget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraCapturePage extends StatefulWidget {
  const CameraCapturePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CameraCaptureState();
}

class _CameraCaptureState extends State<CameraCapturePage> {
  bool _isCameraTurned = false;

  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  XFile? _picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFF9ADFFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              tileMode: TileMode.decal,
            ),
          ),
          child: Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleCameraWidget(
                  cameraController: _cameraController,
                  isCameraTurned: _isCameraTurned,
                  picture: _picture,
                ),
                CaptureButtonWidget(
                  isCameraTurned: _isCameraTurned,
                  onPressed: () {
                    if (_isCameraTurned) {
                      _takePicture();
                    } else {
                      _startCamera();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _startCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras![0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    _cameraController?.setFlashMode(FlashMode.off);
    await _cameraController?.initialize();

    bool permission = await _requestCameraPermission();

    setState(() {
      _isCameraTurned = permission;
    });
  }

  Future<bool> _requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();

    return status == PermissionStatus.granted;
  }

  Future<void> _takePicture() async {
    XFile? picture = await _cameraController?.takePicture();

    setState(() {
      _picture = picture;
      _cameraController?.dispose();
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }
}
