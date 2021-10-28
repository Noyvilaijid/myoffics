import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myoffice/controller/navigetorbar.dart';
import 'package:myoffice/extensions/hover_extension.dart';
import 'package:myoffice/theme/theme.dart';

class AppMenu extends StatelessWidget {
  final Function forcusOnLastOne;
  final Function forcusOnLastTwo;
  final Function forcusOnLastThree;
  final Function forcusOnLastfour;
  final Function forcusOnLastfine;
  final Function forcusOnLastsix;
  final Function forcusOnLastseven;
  AppMenu(
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
    return Drawer(
      child: Container(
        color: colorwhite,
        child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 3.5),
                  child: Image.asset(
                    "assets/bestech.png",
                    width: 150,
                    height: 80,
                  ),
                ),
              ),
              ...List.generate(
                _controller.menuItems.length,
                (index) => DrawerItem(
                  isActive: index == _controller.selectedIndex,
                  title: _controller.menuItems[index],
                  icon: _controller.menuIcon[index],
                  press: () {
                    _controller.setMenuIndex(index);
                    Navigator.of(context).pop();
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
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;
  final Icon icon;
  const DrawerItem({
    Key key,
    @required this.title,
    @required this.isActive,
    @required this.press,
    @required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        selected: isActive,
        selectedTileColor: colorRED,
        leading: icon,
        onTap: press,
        title: Text(
          title,
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
