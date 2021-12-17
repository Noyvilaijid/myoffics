// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:myoffice/controller/service.dart';
// import 'package:myoffice/extensions/hover_extension.dart';
// import 'package:myoffice/models/teamwork.dart';
// import 'package:myoffice/responsive/runningapprespon.dart';
// import 'package:myoffice/theme/theme.dart';
// var url = Url.url;
// class TeamWorkPage extends StatefulWidget {
//   const TeamWorkPage({Key key}) : super(key: key);
//   @override
//   _TeamWorkPageState createState() => _TeamWorkPageState();
// }
// class _TeamWorkPageState extends State<TeamWorkPage> {
//   final List<TeamWork> team = [];
//   Future getteamdata() async {
//     try {
//       var data = await http.get(Uri.parse('$url/teams'));
//       if (data.statusCode == 200) {
//         var jsonData = data.body;
//         List<TeamWork> listimage = teamWorkFromJson(jsonData);
//         return listimage;
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   // int _current = 0;
//   // final CarouselController _controller = CarouselController();
//   @override
//   void initState() {
//     super.initState();
//     getteamdata().then((value) {
//       setState(() {
//         team.addAll(value);
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ResponsiveWidget(
//           mobile: team.length == 0
//               ? Center(child: CircularProgressIndicator())
//               : Center(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "ທີມງານບໍລິສັດຂອງພວກເຮົາ",
//                           style: TextStyle(
//                               color: colorback,
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Phetsarath-OT'),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Expanded(
//                           child: Center(
//                             child: Container(
//                               child: GridView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 2),
//                                   itemCount: team.length,
//                                   itemBuilder: (context, index) {
//                                     return Stack(children: [
//                                       Container(
//                                         height: 200,
//                                         width: 200,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: CircleAvatar(
//                                             backgroundImage: NetworkImage(
//                                                 url + team[index].image[0].url),
//                                           ),
//                                         ),
//                                       ),
//                                       Positioned(
//                                           bottom: 40,
//                                           height: 50,
//                                           child: Container(
//                                             height: 200,
//                                             width: 200,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                                 color: colorblue),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   team[index].name,
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.normal,
//                                                       color: colorwhite,
//                                                       fontFamily:
//                                                           'Phetsarath-OT'),
//                                                 ),
//                                                 Text(
//                                                   team[index].work,
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight:
//                                                           FontWeight.normal,
//                                                       color: colorwhite,
//                                                       fontFamily: 'times'),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                     ]);
//                                   }),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//           tablet: team.length == 0
//               ? Center(child: CircularProgressIndicator())
//               : Center(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 100),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "ທີມງານບໍລິສັດຂອງພວກເຮົາ",
//                           style: TextStyle(
//                               color: colorback,
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Phetsarath-OT'),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Expanded(
//                             child: Center(
//                           child: Container(
//                               child: GridView.builder(
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.horizontal,
//                                   gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                     crossAxisSpacing: 16,
//                                   ),
//                                   itemCount: team.length,
//                                   itemBuilder: (context, index) {
//                                     return Stack(children: [
//                                       Container(
//                                         height: 200,
//                                         width: 200,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: CircleAvatar(
//                                             backgroundImage: NetworkImage(
//                                                 url + team[index].image[0].url),
//                                           ),
//                                         ),
//                                       ),
//                                       Positioned(
//                                           bottom: 40,
//                                           height: 50,
//                                           child: Container(
//                                             height: 200,
//                                             width: 200,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                                 color: colorblue),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                   team[index].name,
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.normal,
//                                                       color: colorwhite,
//                                                       fontFamily:
//                                                           'Phetsarath-OT'),
//                                                 ),
//                                                 Text(
//                                                   team[index].work,
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight:
//                                                           FontWeight.normal,
//                                                       color: colorwhite,
//                                                       fontFamily: 'times'),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                     ]).showCursorOnHover.moveUpOnhover;
//                                   })),
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//           pc: team.length == 0
//               ? Center(child: CircularProgressIndicator())
//               : Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 150),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "ທີມງານບໍລິສັດຂອງພວກເຮົາ",
//                         style: TextStyle(
//                             color: colorback,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Phetsarath-OT'),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Expanded(
//                           child: Center(
//                         child: Container(
//                           child: GridView.builder(
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 16,
//                               ),
//                               itemCount: team.length,
//                               itemBuilder: (context, index) {
//                                 return Stack(children: [
//                                   Container(
//                                     height: 200,
//                                     width: 200,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: CircleAvatar(
//                                         backgroundImage: NetworkImage(
//                                             url + team[index].image[0].url),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                       bottom: 40,
//                                       height: 50,
//                                       child: Container(
//                                         height: 200,
//                                         width: 200,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             color: colorblue),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               team[index].name,
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.normal,
//                                                   color: colorwhite,
//                                                   fontFamily: 'Phetsarath-OT'),
//                                             ),
//                                             Text(
//                                               team[index].work,
//                                               style: TextStyle(
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.normal,
//                                                   color: colorwhite,
//                                                   fontFamily: 'times'),
//                                             ),
//                                           ],
//                                         ),
//                                       )),
//                                 ]); //.showCursorOnHover.moveUpOnhover;
//                               }),
//                         ),
//                       )),
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

// /*
// Stack(
//                   children: [
//                     Positioned.fill(
//                       child: Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: team.asMap().entries.map((entry) {
//                               return GestureDetector(
//                                 onTap: () =>
//                                     _controller.animateToPage(entry.key),
//                                 child: Container(
//                                   width: 12.0,
//                                   height: 12.0,
//                                   margin: EdgeInsets.symmetric(
//                                       vertical: 8.0, horizontal: 8.0),
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: entry.key == _current
//                                           ? Colors.white
//                                           : colormenu),
//                                 ),
//                               );
//                             }).toList(),
//                           )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 50, right: 50),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             "ທີມງານບໍລິສັດຂອງພວກເຮົາ",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Phetsarath-OT'),
//                           ),
//                           Divider(
//                             color: Colors.white,
//                             height: 30,
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           Center(
//                             child: Container(
//                               height: 450,
//                               width: double.infinity,
//                               child: Container(
//                                   child: CarouselSlider(
//                                 options: CarouselOptions(
//                                   onPageChanged: (index, reason) {
//                                     setState(() {
//                                       _current = index;
//                                     });
//                                   },
//                                   aspectRatio: 2.0,
//                                   enlargeCenterPage: true,
//                                   scrollDirection: Axis.horizontal,
//                                 ),
//                                 items: team.map((e) {
//                                   // return Container(
//                                   //   child: container(
//                                   //     url: url + e.image[0].url,
//                                   //     title: e.name,
//                                   //     dec: e.work,
//                                   //   ),
//                                   // );
//                                   return GridView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 2),
//                                     itemCount: team.length,
//                                     itemBuilder: (context, index) {
//                                       return Stack(
//                                         children: [
//                                           Container(
//                                             height: 200,
//                                             width: 200,
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: CircleAvatar(
//                                                 backgroundImage: NetworkImage(
//                                                     url +
//                                                         team[index]
//                                                             .image[0]
//                                                             .url),
//                                               ),
//                                             ),
//                                           ),
//                                           Positioned(
//                                               bottom: 10,
//                                               height: 50,
//                                               child: Container(
//                                                 height: 200,
//                                                 width: 200,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             20),
//                                                     color: Colors.red),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.center,
//                                                   children: [
//                                                     Text(
//                                                       e.name,
//                                                       style: TextStyle(
//                                                           fontSize: 10,
//                                                           fontWeight:
//                                                               FontWeight.normal,
//                                                           color: Colors.white,
//                                                           fontFamily:
//                                                               'Phetsarath-OT'),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 5,
//                                                     ),
//                                                     Text(
//                                                       e.work,
//                                                       style: TextStyle(
//                                                           fontSize: 12,
//                                                           fontWeight:
//                                                               FontWeight.normal,
//                                                           color: Colors.white,
//                                                           fontFamily: 'times'),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )),
//                                         ],
//                                       );
//                                     },
//                                   );
//                                 }).toList(),
//                               )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
// */

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
import 'package:myoffice/theme/theme.dart';

import 'widgetteamwork.dart';
class TeamWorkPage extends StatefulWidget {
  const TeamWorkPage({Key key}) : super(key: key);
  @override
  _TeamWorkPageState createState() => _TeamWorkPageState();
}
class _TeamWorkPageState extends State<TeamWorkPage> {
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
                  child: TeamWorkPages(),
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
