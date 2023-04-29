import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class DisplayPictureWidget extends StatelessWidget {
  final XFile? picture;

  const DisplayPictureWidget({Key? key, required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 280.0,
        height: 280.0,
        child: picture != null ? Image.file(
          File(picture!.path),
          fit: BoxFit.cover,
        ) : Container()
      ),
    );
  }
}
