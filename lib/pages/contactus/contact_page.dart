import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myoffice/controller/service.dart';
import 'package:myoffice/models/Contactmd.dart';
import 'package:myoffice/responsive/runningapprespon.dart';
import 'package:http/http.dart' as http;
import 'package:myoffice/theme/theme.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var url = Url.url;
  bool loading = true;
  // ignore: deprecated_member_use
  List<Contact> about = new List();
  // ignore: missing_return
  Future<List<Contact>> getdata() async {
    try {
      var data = await http.get(Uri.parse('$url/contacts'));
      if (data.statusCode == 200) {
        var jsonData = data.body;
        var list = json.decode(jsonData) as List;
        List<Contact> values = list.map((e) => Contact.fromJson(e)).toList();
        setState(() {
          about.addAll(values);
          loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : ResponsiveWidget(
                mobile: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Card(
                          elevation: 1,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "ຕິດຕໍ່",
                                  style: TextStyle(
                                      color: colorback,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontFamily: 'Phetsarath-OT'),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: colorback,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextTitle(
                                        color: colorback,
                                        fontWeight: FontWeight.normal,
                                        size: 16,
                                        text: about[0].contact,
                                        fontFamily: 'Phetsarath-OT'),
                                  ],
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                TextTitle(
                                    color: colorback,
                                    fontWeight: FontWeight.normal,
                                    size: 18,
                                    text: about[0].details,
                                    fontFamily: 'times'),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: colorback,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextTitle(
                                        color: colorback,
                                        fontWeight: FontWeight.normal,
                                        size: 20,
                                        text: about[1].contact,
                                        fontFamily: 'times'),
                                  ],
                                ),
                                TextTitle(
                                    color: colorback,
                                    fontWeight: FontWeight.normal,
                                    size: 20,
                                    text: about[1].details,
                                    fontFamily: 'times'),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: colorback,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TextTitle(
                                        color: colorback,
                                        fontWeight: FontWeight.normal,
                                        size: 16,
                                        text: about[2].contact,
                                        fontFamily: 'Phetsarath-OT'),
                                  ],
                                ),
                                TextTitle(
                                    color: colorback,
                                    fontWeight: FontWeight.normal,
                                    size: 16,
                                    text: about[2].details,
                                    fontFamily: 'Phetsarath-OT'),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  height: 2,
                                  width: double.infinity,
                                  color: colorback,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "official bestech social midia"
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: colorback,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontFamily: 'times'),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: new Icon(
                                              Icons.facebook,
                                              color: Colors.green,
                                              size: 40,
                                            ),
                                            highlightColor: Colors.pink,
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          IconButton(
                                            icon: new Icon(
                                              Icons.home,
                                              color: Colors.green,
                                              size: 40,
                                            ),
                                            highlightColor: Colors.pink,
                                            onPressed: () {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          elevation: 7,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: colorgray),
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                  "Copyright @ 2021 Bestech All Rights Reserved",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: colorwhite,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'times')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                tablet: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          flex: 7,
                          child: Card(
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ຕິດຕໍ່",
                                    style: TextStyle(
                                        color: colorback,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        fontFamily: 'Phetsarath-OT'),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                color: colorback,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextTitle(
                                                  color: colorback,
                                                  fontWeight: FontWeight.normal,
                                                  size: 16,
                                                  text: about[0].contact,
                                                  fontFamily: 'Phetsarath-OT'),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Expanded(
                                                child: TextTitle(
                                                    color: colorback,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    size: 18,
                                                    text: about[0].details,
                                                    fontFamily: 'times'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.email,
                                                color: colorback,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextTitle(
                                                  color: colorback,
                                                  fontWeight: FontWeight.normal,
                                                  size: 20,
                                                  text: about[1].contact,
                                                  fontFamily: 'times'),
                                              SizedBox(
                                                width: 100,
                                              ),
                                              Expanded(
                                                child: TextTitle(
                                                    color: colorback,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    size: 20,
                                                    text: about[1].details,
                                                    fontFamily: 'times'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.home,
                                                color: colorback,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              TextTitle(
                                                  color: colorback,
                                                  fontWeight: FontWeight.normal,
                                                  size: 16,
                                                  text: about[2].contact,
                                                  fontFamily: 'Phetsarath-OT'),
                                              SizedBox(
                                                width: 130,
                                              ),
                                              Expanded(
                                                child: TextTitle(
                                                    color: colorback,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    size: 16,
                                                    text: about[2].details,
                                                    fontFamily:
                                                        'Phetsarath-OT'),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    height: 2,
                                    width: double.infinity,
                                    color: colorback,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "official bestech social midia"
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: colorback,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18,
                                            fontFamily: 'times'),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: new Icon(
                                              Icons.facebook,
                                              color: colorback,
                                              size: 40,
                                            ),
                                            highlightColor: Colors.pink,
                                            onPressed: () {},
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          IconButton(
                                            icon: new Icon(
                                              Icons.home,
                                              color: colorback,
                                              size: 40,
                                            ),
                                            highlightColor: Colors.pink,
                                            onPressed: () {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: colorgray),
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                  "Copyright @ 2021 Bestech All Rights Reserved",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: colorwhite,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'times')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pc: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          flex: 7,
                          child: Card(
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ຕິດຕໍ່",
                                    style: TextStyle(
                                        color: colorback,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        fontFamily: 'Phetsarath-OT'),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    color: colorback,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  TextTitle(
                                                      color: colorback,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      size: 16,
                                                      text: about[0].contact,
                                                      fontFamily:
                                                          'Phetsarath-OT'),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Expanded(
                                                    child: TextTitle(
                                                        color: colorback,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        size: 18,
                                                        text: about[0].details,
                                                        fontFamily: 'times'),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.email,
                                                    color: colorback,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  TextTitle(
                                                      color: colorback,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      size: 20,
                                                      text: about[1].contact,
                                                      fontFamily: 'times'),
                                                  SizedBox(
                                                    width: 100,
                                                  ),
                                                  Expanded(
                                                    child: TextTitle(
                                                        color: colorback,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        size: 20,
                                                        text: about[1].details,
                                                        fontFamily: 'times'),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.home,
                                                    color: colorback,
                                                    size: 25,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  TextTitle(
                                                      color: colorback,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      size: 16,
                                                      text: about[2].contact,
                                                      fontFamily:
                                                          'Phetsarath-OT'),
                                                  SizedBox(
                                                    width: 130,
                                                  ),
                                                  Expanded(
                                                    child: TextTitle(
                                                        color: colorback,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        size: 16,
                                                        text: about[2].details,
                                                        fontFamily:
                                                            'Phetsarath-OT'),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      )),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        height: 250,
                                        width: 2,
                                        color: colorback,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                          child: Container(
                                        padding: EdgeInsets.only(bottom: 50),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "official bestech social midia"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  color: colorback,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 18,
                                                  fontFamily: 'times'),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: new Icon(
                                                    Icons.facebook,
                                                    color: colorback,
                                                    size: 40,
                                                  ),
                                                  highlightColor: Colors.pink,
                                                  onPressed: () {},
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                IconButton(
                                                  icon: new Icon(
                                                    Icons.home,
                                                    color: colorback,
                                                    size: 40,
                                                  ),
                                                  highlightColor: Colors.pink,
                                                  onPressed: () {},
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: colorgray),
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                  "Copyright @ 2021 Bestech All Rights Reserved",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: colorwhite,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'times')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final String fontFamily;
  final FontWeight fontWeight;
  const TextTitle({
    Key key,
    this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.fontFamily,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
    );
  }
}
