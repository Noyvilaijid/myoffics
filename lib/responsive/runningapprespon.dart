import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget pc;
  const ResponsiveWidget({Key key, this.mobile, this.tablet, this.pc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 900) {
        return pc;
      } else if (constraints.maxWidth >= 650) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
