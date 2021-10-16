import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myoffice/controller/navigetorbar.dart';
import 'package:myoffice/menubar/web_menu.dart';
import 'package:myoffice/responsive/responsive.dart';
import 'package:myoffice/theme/theme.dart';

class Header extends StatelessWidget {
  final Function forcusOnLastOne;
  final Function forcusOnLastwo;
  final Function forcusOnLastThree;
  final Function forcusOnLastfour;
  final Function forcusOnLastfine;
  final Function forcusOnLastsix;
  final Function forcusOnLastseven;
  Header(
      {this.forcusOnLastOne,
      this.forcusOnLastwo,
      this.forcusOnLastThree,
      this.forcusOnLastfour,
      this.forcusOnLastfine,
      this.forcusOnLastsix,
      this.forcusOnLastseven});
  final Navigetorbar _controller = Get.put(Navigetorbar());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: kMaxWidth),
            // padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: colormenu,
                        ),
                        onPressed: () {
                          _controller.openOrCloseDrawer();
                        },
                      ),
                    Image.asset(
                      "assets/bestech.png",
                      width: 150,
                      height: 80,
                    ),
                    Spacer(),
                    if (Responsive.isDesktop(context))
                      WebMenu(
                        forcusOnLastOne: forcusOnLastOne,
                        forcusOnLastTwo: forcusOnLastwo,
                        forcusOnLastThree: forcusOnLastThree,
                        forcusOnLastfour: forcusOnLastfour,
                        forcusOnLastfine: forcusOnLastfine,
                        forcusOnLastsix: forcusOnLastsix,
                        forcusOnLastseven: forcusOnLastseven,
                      ),
                    Spacer(),
                  ],
                ),
                if (Responsive.isMobile(context))
                  SizedBox(height: kDefaultPadding),
                // AppMenu(
                //   forcusOnLastOne: forcusOnLastOne,
                //   forcusOnLastTwo: forcusOnLastwo,
                //   forcusOnLastThree: forcusOnLastThree,
                //   forcusOnLastfour: forcusOnLastfour,
                //   forcusOnLastfine: forcusOnLastfine,
                //   forcusOnLastsix: forcusOnLastsix,
                //   forcusOnLastseven: forcusOnLastseven,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
