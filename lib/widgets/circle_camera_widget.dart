import 'package:camera/camera.dart';
import 'package:camera_capture_flutter/widgets/display_image_widget.dart';
import 'package:camera_capture_flutter/widgets/camera_preview_widget.dart';
import 'package:flutter/cupertino.dart';

class CircleCameraWidget extends StatelessWidget {
  final CameraController? cameraController;
  final bool isCameraTurned;
  final XFile? picture;

  const CircleCameraWidget({
    Key? key,
    required this.cameraController,
    required this.isCameraTurned,
    required this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 36.0),
        child: Container(
          width: 280.0,
          height: 280.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xF3257BEF),
          ),
          child: (picture == null && isCameraTurned)
              ? CameraPreviewWidget(cameraController: cameraController!)
              : DisplayPictureWidget(picture: picture),
        ),
      ),
    );
  }
}
