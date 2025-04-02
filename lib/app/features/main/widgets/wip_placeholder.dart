import 'package:flutter/material.dart';

class WipPlaceholder extends StatelessWidget {
  const WipPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const _NotebookPaper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 160),
                  child: Text(
                    'Em breve',
                    style: TextStyle(fontFamily: 'Kalufonia', fontSize: 32),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'ACHADOS\n\t\t\t\t\t\t\tDA LAZU',
                  style: TextStyle(fontFamily: 'Kalufonia', fontSize: 72),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 160),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' \u2015 Seu perfil de achadinhos de confiança',
                    style: TextStyle(fontFamily: 'Kalufonia', fontSize: 32),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotebookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.pink.shade100
          ..style = PaintingStyle.fill;

    final path =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height),
            const Radius.circular(10),
          ),
        );

    canvas.drawPath(path, paint);

    final holePaint =
        Paint()
          ..color = Colors.brown.shade50
          ..style = PaintingStyle.fill;

    for (double i = 80; i < size.height - 80; i += 160) {
      canvas.drawCircle(Offset(40, i), 16, holePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _NotebookPaper extends StatelessWidget {
  const _NotebookPaper({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: _NotebookPainter(),
            ),
            Positioned.fill(left: 80, child: child),
          ],
        );
      },
    );
  }
}
