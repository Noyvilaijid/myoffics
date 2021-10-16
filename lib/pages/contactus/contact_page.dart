import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myoffice/controller/service.dart';
import 'package:myoffice/models/Contactmd.dart';
import 'package:myoffice/responsive/runningapprespon.dart';
import 'package:http/http.dart' as http;

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var url = Url.url;
  bool loading = true;
  List<Contact> about = new List();
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
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "ຕິດຕໍ່",
                          style: TextStyle(
                              color: Colors.black,
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
                              color: Colors.black,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextTitle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                size: 16,
                                text: about[0].contact,
                                fontFamily: 'Phetsarath-OT'),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: TextTitle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
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
                              color: Colors.black,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextTitle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                size: 20,
                                text: about[1].contact,
                                fontFamily: 'times'),
                            SizedBox(
                              width: 100,
                            ),
                            Expanded(
                              child: TextTitle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
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
                              color: Colors.black,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            TextTitle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                size: 16,
                                text: about[2].contact,
                                fontFamily: 'Phetsarath-OT'),
                            SizedBox(
                              width: 130,
                            ),
                            Expanded(
                              child: TextTitle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  size: 16,
                                  text: about[2].details,
                                  fontFamily: 'Phetsarath-OT'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 2,
                          width: double.infinity,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "official bestech social midia".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
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
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                                "Copyright @ 2021 Bestech All Rights Reserved",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'times')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                tablet: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "ຕິດຕໍ່",
                          style: TextStyle(
                              color: Colors.black,
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
                                flex: 3,
                                child: Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              color: Colors.black,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextTitle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                size: 16,
                                                text: about[0].contact,
                                                fontFamily: 'Phetsarath-OT'),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Expanded(
                                              child: TextTitle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
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
                                              color: Colors.black,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextTitle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                size: 20,
                                                text: about[1].contact,
                                                fontFamily: 'times'),
                                            SizedBox(
                                              width: 100,
                                            ),
                                            Expanded(
                                              child: TextTitle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
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
                                              color: Colors.black,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            TextTitle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                size: 16,
                                                text: about[2].contact,
                                                fontFamily: 'Phetsarath-OT'),
                                            SizedBox(
                                              width: 130,
                                            ),
                                            Expanded(
                                              child: TextTitle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  size: 16,
                                                  text: about[2].details,
                                                  fontFamily: 'Phetsarath-OT'),
                                            ),
                                          ],
                                        ),
                                      ]),
                                )),
                            Container(
                              padding: EdgeInsets.all(8),
                              height: 250,
                              width: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                flex: 2,
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
                                            color: Colors.black,
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
                                              color: Colors.black,
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
                                              color: Colors.black,
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                                "Copyright @ 2021 Bestech All Rights Reserved",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'times')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pc: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "ຕິດຕໍ່",
                          style: TextStyle(
                              color: Colors.black,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        TextTitle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            size: 16,
                                            text: about[0].contact,
                                            fontFamily: 'Phetsarath-OT'),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: TextTitle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
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
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        TextTitle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            size: 20,
                                            text: about[1].contact,
                                            fontFamily: 'times'),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Expanded(
                                          child: TextTitle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
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
                                          color: Colors.black,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        TextTitle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            size: 16,
                                            text: about[2].contact,
                                            fontFamily: 'Phetsarath-OT'),
                                        SizedBox(
                                          width: 130,
                                        ),
                                        Expanded(
                                          child: TextTitle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              size: 16,
                                              text: about[2].details,
                                              fontFamily: 'Phetsarath-OT'),
                                        ),
                                      ],
                                    ),
                                  ]),
                            )),
                            Container(
                              padding: EdgeInsets.all(8),
                              height: 250,
                              width: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(bottom: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "official bestech social midia"
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black,
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
                                          color: Colors.black,
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
                                          color: Colors.black,
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                                "Copyright @ 2021 Bestech All Rights Reserved",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'times')),
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
