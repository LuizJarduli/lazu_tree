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

  static const double editingHeight = 85;

  static const double normalHeight = 90;

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
            top: -95,
            child: Container(
              width: 190,
              height: 190,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    'images/profile_placeholder.png',
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 140,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(children: [Text('Profile')]),
            ),
          ),
        ],
      ),
    );
  }
}

class LinkTreeProfilePainter extends CustomPainter {
  const LinkTreeProfilePainter({this.curveHeight = 120});

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
          ..lineTo(insetBeginningX, 0)
          ..arcToPoint(Offset(insetEndX, 0), radius: const Radius.circular(10))
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
