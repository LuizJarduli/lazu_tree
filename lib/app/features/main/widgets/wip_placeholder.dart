import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_route.dart';
import 'package:lazu_tree/app/shared/extensions/app_breakpoints_ext.dart';

class WipPlaceholder extends StatelessWidget {
  const WipPlaceholder({required this.constraints, super.key});

  final BoxConstraints constraints;

  bool get isMedium => constraints.isMedium;

  bool get isSmall => constraints.isSmall;

  @override
  Widget build(BuildContext context) {
    return _NotebookPaper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 160),
                child: Text(
                  'Em breve',
                  style: TextStyle(
                    fontFamily: 'Kalufonia',
                    fontSize: isMedium || isSmall ? 16 : 32,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'ACHADOS\n\t\t\t\t\t\t\tDA LAZU',
                style: TextStyle(
                  fontFamily: 'Kalufonia',
                  fontSize: isMedium || isSmall ? 36 : 72,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: isMedium || isSmall ? 0 : 160),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ' \u2015 Seu perfil de achadinhos de confiança',
                  style: TextStyle(
                    fontFamily: 'Kalufonia',
                    fontSize: isMedium || isSmall ? 16 : 32,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 160),
                child: ElevatedButton.icon(
                  onPressed: () => context.push(LinkTreeRoute.path),
                  label: const Text('Ir para os links'),
                  icon: const Icon(Icons.arrow_right_alt),
                ),
              ),
            ),
          ),
        ],
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
