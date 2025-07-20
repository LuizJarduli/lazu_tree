import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/features/link_tree/link_tree_cubit.dart';

class LinkTreeAdminBottomBar extends StatefulWidget {
  const LinkTreeAdminBottomBar({super.key});

  @override
  State<LinkTreeAdminBottomBar> createState() => _LinkTreeAdminBottomBarState();
}

class _LinkTreeAdminBottomBarState extends State<LinkTreeAdminBottomBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController? _animationController;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void toggleSlide({required bool toggle}) {
    if (toggle) {
      _animationController?.forward();
    } else {
      _animationController?.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const height = kToolbarHeight;

    final primaryColor = Theme.of(context).colorScheme.primary;

    return BlocListener<LinkTreeCubit, LinkTreeState>(
      listener: (context, state) => toggleSlide(toggle: state.isEditing),
      listenWhen:
          (previous, current) => previous.isEditing != current.isEditing,
      child: SlideTransition(
        position: _animation,
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, height + 6),
                painter: const BottomNavCurvePainter(),
              ),
              Center(
                heightFactor: 0.6,
                child: FloatingActionButton(
                  backgroundColor: primaryColor,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  elevation: 0.1,
                  tooltip: 'Editar página',
                  onPressed: () {},
                  child: const Icon(Icons.draw_outlined),
                ),
              ),
              SizedBox(
                height: height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarIcon(
                      text: 'Tema',
                      icon: Icons.invert_colors,
                      onPressed: () {},
                      selectedColor: primaryColor,
                    ),
                    NavBarIcon(
                      text: 'Analíticos',
                      icon: Icons.analytics_outlined,
                      onPressed: () {},
                      selectedColor: primaryColor,
                    ),
                    const SizedBox(width: 56),
                    NavBarIcon(
                      text: 'Notificações',
                      icon: Icons.notification_add_outlined,
                      onPressed: () {},
                      selectedColor: primaryColor,
                    ),
                    NavBarIcon(
                      text: 'Opções',
                      icon: Icons.settings_outlined,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      selectedColor: primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  const BottomNavCurvePainter({
    this.backgroundColor = Colors.white,
    this.insetRadius = 38,
  });

  final Color backgroundColor;

  final double insetRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill;
    final path = Path()..moveTo(0, 12);

    final insetCurveBeginningX = size.width / 2 - insetRadius;
    final insetCurveEndX = size.width / 2 + insetRadius;
    final transitionToInsetCurveWidth = size.width * .05;

    path
      ..arcToPoint(const Offset(8, 8), radius: const Radius.circular(10))
      ..quadraticBezierTo(
        size.width * 0.20,
        0,
        insetCurveBeginningX - transitionToInsetCurveWidth,
        0,
      )
      ..quadraticBezierTo(
        insetCurveBeginningX,
        0,
        insetCurveBeginningX,
        insetRadius / 2,
      )
      ..arcToPoint(
        Offset(insetCurveEndX, insetRadius / 2),
        radius: const Radius.circular(10),
        clockwise: false,
      )
      ..quadraticBezierTo(
        insetCurveEndX,
        0,
        insetCurveEndX + transitionToInsetCurveWidth,
        0,
      )
      ..quadraticBezierTo(size.width * 0.80, 0, size.width - 8, 12)
      ..arcToPoint(
        Offset(size.width, 16),
        radius: const Radius.circular(10),
        rotation: 180,
      )
      ..lineTo(size.width, size.height + 56)
      // +56 here extends the navbar below app bar to include extra space on
      // some screens (iPhone 11)
      ..lineTo(0, size.height + 56);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({
    required this.text,
    required this.icon,
    required this.onPressed,
    this.selected = false,
    this.selectedColor = const Color(0xffFF8527),
    this.defaultColor = Colors.grey,
    super.key,
  });
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 20,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
