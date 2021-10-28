import 'package:flutter/material.dart';
class OnHover extends StatefulWidget {
  final Widget child;
  const OnHover({Key key, this.child}) : super(key: key);
  @override
  _OnHoverState createState() => _OnHoverState();
}
class _OnHoverState extends State<OnHover> {
  final nonHover = Matrix4.identity();
  final hovertran = Matrix4.identity()..translate(0, 10, -5);
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => mouseEnter(true),
      onExit: (e) => mouseEnter(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: widget.child,
        transform: hovering?hovertran:nonHover,
      ),
    );
  }

  void mouseEnter(bool hover) {
    setState(() {
      hovering = hover;
    });
  }
}
