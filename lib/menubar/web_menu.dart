import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myoffice/controller/navigetorbar.dart';
import 'package:myoffice/extensions/hover_extension.dart';
import 'package:myoffice/theme/theme.dart';

class WebMenu extends StatelessWidget {
  final Function forcusOnLastOne;
  final Function forcusOnLastTwo;
  final Function forcusOnLastThree;
  final Function forcusOnLastfour;
  final Function forcusOnLastfine;
  final Function forcusOnLastsix;
  final Function forcusOnLastseven;
  WebMenu(
      {this.forcusOnLastOne,
      this.forcusOnLastTwo,
      this.forcusOnLastThree,
      this.forcusOnLastfour,
      this.forcusOnLastfine,
      this.forcusOnLastsix,
      this.forcusOnLastseven});
  final Navigetorbar _controller = Get.put(Navigetorbar());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          _controller.menuItems.length,
          (index) => WebMenuItem(
            text: _controller.menuItems[index],
            isActive: index == _controller.selectedIndex,
            press: () {
              _controller.setMenuIndex(index);
              if (index == 0) {
                forcusOnLastOne();
              }
              if (index == 1) {
                forcusOnLastTwo();
              }
              if (index == 2) {
                forcusOnLastThree();
              }
              if (index == 3) {
                forcusOnLastfour();
              }
              if (index == 4) {
                forcusOnLastfine();
              }
              if (index == 5) {
                forcusOnLastsix();
              }
              if (index == 6) {
                forcusOnLastseven();
              }
            },
          )//.showCursorOnHover.moveUpOnhover,
        ),
      ),
    );
  }
}

class WebMenuItem extends StatefulWidget {
  const WebMenuItem({
    Key key,
    @required this.isActive,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  _WebMenuItemState createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return colorblue;
    } else if (!widget.isActive & _isHover) {
      return colorblue;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: _borderColor(), width: 3),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: 'Phetsarath-OT',
              fontSize: 18),
        ),
      ),
    );
  }
}
