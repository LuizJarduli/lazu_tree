import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';

class LinkTreeProfileContainer extends StatefulWidget {
  const LinkTreeProfileContainer({super.key});

  @override
  State<LinkTreeProfileContainer> createState() =>
      _LinkTreeProfileContainerState();
}

class _LinkTreeProfileContainerState extends State<LinkTreeProfileContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _curveHeightAnimation;

  static const double editingHeight = 100;
  static const double normalHeight = 130;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _curveHeightAnimation = Tween<double>(
      begin: normalHeight,
      end: editingHeight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isEditing = context.watch<LinkTreeCubit>().state.isEditing;
    if (isEditing) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBuilder(
            animation: _curveHeightAnimation,
            builder: (context, child) {
              return CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 160),
                painter: LinkTreeProfilePainter(
                  curveHeight: _curveHeightAnimation.value,
                ),
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -60,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
          Positioned(top: 10, bottom: 0, child: Container(color: Colors.amber)),
        ],
      ),
    );
  }
}

class LinkTreeProfilePainter extends CustomPainter {
  const LinkTreeProfilePainter({this.curveHeight = 130});

  final double curveHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final insetBeginningX = size.width / 2 - curveHeight;
    final insetEndX = size.width / 2 + curveHeight;

    final path =
        Path()
          ..moveTo(0, 0)
          ..lineTo(insetBeginningX / 2, 0)
          ..cubicTo(
            insetBeginningX,
            0,
            insetBeginningX,
            -curveHeight,
            size.width / 2,
            -curveHeight,
          )
          ..cubicTo(
            insetEndX,
            -curveHeight,
            insetEndX,
            0,
            size.width - (insetBeginningX / 2),
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
