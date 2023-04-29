import 'package:flutter/material.dart';

class CaptureButtonWidget extends StatelessWidget {
  final bool isCameraTurned;
  final Function onPressed;

  const CaptureButtonWidget({Key? key, required this.isCameraTurned, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Center(
        child: TextButton(
          onPressed: () {
            onPressed();
          },
          child: Container(
            child: Text(
              isCameraTurned ? 'Capture photo' : 'Turn on Camera',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => isCameraTurned
                    ? const Color(0xFF87DE18)
                    : const Color(0xF3257BEF)),
            padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.only(
                top: 18.0,
                bottom: 18.0,
                left: 24.0,
                right: 24.0,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}