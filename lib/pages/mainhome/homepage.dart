import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myoffice/controller/navigetorbar.dart';
import 'package:myoffice/menubar/app_menu.dart';
import 'package:myoffice/menubar/header.dart';
import 'package:myoffice/pages/about/about_page.dart';
import 'package:myoffice/pages/contactus/contact_page.dart';
import 'package:myoffice/pages/home/home_page.dart';
import 'package:myoffice/pages/meeting/meeting_page.dart';
import 'package:myoffice/pages/pastwork/pastwork_page.dart';
import 'package:myoffice/pages/service/service_page.dart';
import 'package:myoffice/pages/teamwork/teamwork_page.dart';
import 'package:myoffice/theme/theme.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key key}) : super(key: key);
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final Navigetorbar _controller = Get.put(Navigetorbar());
  final datekey1 = new GlobalKey();
  final datekey2 = new GlobalKey();
  final datekey3 = new GlobalKey();
  final datekey4 = new GlobalKey();
  final datekey5 = new GlobalKey();
  final datekey6 = new GlobalKey();
  final datekey7 = new GlobalKey();
  Future<Null> refresh() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed("/");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: colorwhite,
        title: Header(
          forcusOnLastOne: () {
            Scrollable.ensureVisible(datekey1.currentContext);
          },
          forcusOnLastwo: () {
            Scrollable.ensureVisible(datekey2.currentContext);
          },
          forcusOnLastThree: () {
            Scrollable.ensureVisible(datekey3.currentContext);
          },
          forcusOnLastfour: () {
            Scrollable.ensureVisible(datekey4.currentContext);
          },
          forcusOnLastfine: () {
            Scrollable.ensureVisible(datekey5.currentContext);
          },
          forcusOnLastsix: () {
            Scrollable.ensureVisible(datekey6.currentContext);
          },
          forcusOnLastseven: () {
            Scrollable.ensureVisible(datekey7.currentContext);
          },
        ),
      ),
      drawer: AppMenu(
        forcusOnLastOne: () {
          Scrollable.ensureVisible(datekey1.currentContext);
        },
        forcusOnLastTwo: () {
          Scrollable.ensureVisible(datekey2.currentContext);
        },
        forcusOnLastThree: () {
          Scrollable.ensureVisible(datekey3.currentContext);
        },
        forcusOnLastfour: () {
          Scrollable.ensureVisible(datekey4.currentContext);
        },
        forcusOnLastfine: () {
          Scrollable.ensureVisible(datekey5.currentContext);
        },
        forcusOnLastsix: () {
          Scrollable.ensureVisible(datekey6.currentContext);
        },
        forcusOnLastseven: () {
          Scrollable.ensureVisible(datekey7.currentContext);
        },
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  key: datekey1,
                  height: 650,
                  width: double.infinity,
                  child: HomePage(),
                ),
                Container(
                  key: datekey2,
                  height: 650,
                  width: double.infinity,
                  child: AboutPage(),
                ),
                Container(
                  key: datekey3,
                  height: 650,
                  width: double.infinity,
                  child: ServicePage(),
                ),
                Container(
                  key: datekey4,
                  height: 650,
                  width: double.infinity,
                  child: PastWork(),
                ),
                Container(
                  key: datekey5,
                  height: 650,
                  width: double.infinity,
                  child: TeamWorkPage(),
                ),
                Container(
                  key: datekey6,
                  height: 650,
                  width: double.infinity,
                  child: MeetingPage(),
                ),
                Container(
                  key: datekey7,
                  height: 650,
                  width: double.infinity,
                  child: ContactPage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
