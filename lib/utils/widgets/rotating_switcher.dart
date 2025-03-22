import 'package:flutter/material.dart';
import 'dart:math';

class RotatingIcon extends StatefulWidget {
  final bool isNeedGrid;
  final bool isRotating; // New state to control rotation
  final Duration duration;

  const RotatingIcon({
    Key? key,
    required this.isNeedGrid,
    required this.isRotating,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _RotatingIconState createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(RotatingIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRotating) {
      _controller.forward().then((_) => _controller.reset());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: AnimatedSwitcher(
        duration: widget.duration,
        child: widget.isNeedGrid
            ? Icon(Icons.list, key: ValueKey("list"))
            : Icon(Icons.grid_view, key: ValueKey("grid")),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
