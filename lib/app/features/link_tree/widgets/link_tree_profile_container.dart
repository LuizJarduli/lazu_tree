import 'package:flutter/material.dart';

class LinkTreeProfileContainer extends StatelessWidget {
  const LinkTreeProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: const Size(double.infinity, 160),
          painter: LinkTreeProfilePainter(),
        ),
        const Positioned(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class LinkTreeProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    const curveHeight = 140.0;
    final insetBeginningX = size.width / 2 - curveHeight;
    final insetCurveBeginningX = insetBeginningX / 2 + 15;
    final insetEndX = size.width / 2 + curveHeight;
    // final insetCurveEndX = insetEndX + 15;
    const insetCurveHeight = curveHeight * 1.2;

    final path =
        Path()
          ..moveTo(0, 0)
          // Entry curve (left)
          ..lineTo(insetCurveBeginningX, 0)
          ..quadraticBezierTo(
            insetBeginningX,
            0,
            size.width / 3.5,
            (curveHeight / 4) * -1,
          )
          // Main central curve
          ..quadraticBezierTo(
            size.width / 2,
            -insetCurveHeight,
            insetEndX,
            (curveHeight / 6) * -1,
          )
          // Exit curve (right, symmetric)
          ..quadraticBezierTo(
            insetEndX,
            0,
            size.width - insetCurveBeginningX,
            0,
          )
          ..lineTo(size.width, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
