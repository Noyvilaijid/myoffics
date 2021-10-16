import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:myoffice/extensions/on_hover.dart';

extension HoverExtantion on Widget {
  static final appContainer =
      html.window.document.getElementById("app-container");
  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      onHover: (event) => appContainer.style.cursor = 'poiter',
      onExit: (event) => appContainer.style.cursor = 'default',
    );
  }

  Widget get moveUpOnhover {
    return OnHover(child: this);
  }
}
