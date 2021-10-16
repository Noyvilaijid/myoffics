import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myoffice/controller/service.dart';
import 'package:myoffice/extensions/hover_extension.dart';
import 'package:myoffice/models/services.dart';
import 'package:myoffice/responsive/runningapprespon.dart';
import 'package:http/http.dart' as http;
import 'package:myoffice/theme/theme.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key key}) : super(key: key);
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  var count = 3;
  var url = Url.url;
  final List<Services> service = [];
  Future getdata() async {
    try {
      var data = await http.get(Uri.parse('$url/services'));
      if (data.statusCode == 200) {
        var jsonData = data.body;
        List<Services> listimage = servicesFromJson(jsonData);
        return listimage;
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    super.initState();
    getdata().then((value) {
      setState(() {
        service.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ResponsiveWidget(
      mobile: service.length == 0
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "ບໍລິການ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Phetsarath-OT'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: count >= service.length
                                ? service.length
                                : count,
                            itemBuilder: (contect, index) {
                              return Card(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            url + service[index].images[0].url,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(service[index].title,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontFamily: 'Phetsarath-OT',
                                                )),
                                            Text(service[index].content,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Phetsarath-OT',
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 45,
                                            child: RaisedButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (count >= service.length) {
                                                    count = service.length;
                                                  } else {
                                                    count += 3;
                                                  }
                                                });
                                              },
                                              color: menuselect,
                                              disabledColor: Colors.blue,
                                              disabledElevation: 4,
                                              elevation: 4,
                                              hoverColor: maincolor,
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: Text("ເພີ່ມເຕີມ",
                                                  style: TextStyle(
                                                    color: colormenu,
                                                    fontSize: 14,
                                                    fontFamily: 'Phetsarath-OT',
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                      width: 10,
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // ignore: deprecated_member_use
                          Card(
                            elevation: 10,
                            child: Container(
                              width: 150,
                              height: 45,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    if (count >= service.length) {
                                      count = service.length;
                                    } else {
                                      count += 3;
                                    }
                                  });
                                },
                                color: menuselect,
                                disabledColor: Colors.blue,
                                disabledElevation: 4,
                                elevation: 4,
                                hoverColor: maincolor,
                                padding: const EdgeInsets.all(14.0),
                                child: Text("ເບີ່ງເພີ່ມເຕີມ. . .",
                                    style: TextStyle(
                                      color: colormenu,
                                      fontSize: 14,
                                      fontFamily: 'Phetsarath-OT',
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      tablet: service.length == 0
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "ບໍລິການ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Phetsarath-OT'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: count >= service.length
                                ? service.length
                                : count,
                            itemBuilder: (contect, index) {
                              return Card(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            url + service[index].images[0].url,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(service[index].title,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontFamily: 'Phetsarath-OT',
                                                )),
                                            Text(service[index].content,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Phetsarath-OT',
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // ignore: deprecated_member_use
                                          RaisedButton(
                                            onPressed: () {
                                              setState(() {
                                                if (count >= service.length) {
                                                  count = service.length;
                                                } else {
                                                  count += 3;
                                                }
                                              });
                                            },
                                            color: menuselect,
                                            textColor: Colors.white,
                                            disabledColor: Colors.blue,
                                            disabledTextColor: Colors.white,
                                            disabledElevation: 4,
                                            elevation: 4,
                                            hoverColor: maincolor,
                                            padding: const EdgeInsets.all(14.0),
                                            child: Text("ເພີ່ມເຕີມ",
                                                style: TextStyle(
                                                  color: colormenu,
                                                  fontSize: 16,
                                                  fontFamily: 'Phetsarath-OT',
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                      width: 10,
                                    )
                                  ],
                                ),
                              ).showCursorOnHover.moveUpOnhover;
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // ignore: deprecated_member_use
                          Card(
                            elevation: 10,
                            child: Container(
                              width: 200,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    if (count >= service.length) {
                                      count = service.length;
                                    } else {
                                      count += 3;
                                    }
                                  });
                                },
                                color: menuselect,
                                textColor: Colors.white,
                                disabledColor: Colors.blue,
                                disabledTextColor: Colors.white,
                                disabledElevation: 4,
                                elevation: 4,
                                hoverColor: maincolor,
                                padding: const EdgeInsets.all(14.0),
                                child: Text("ເບີ່ງເພີ່ມເຕີມ. . .",
                                    style: TextStyle(
                                      color: colormenu,
                                      fontSize: 16,
                                      fontFamily: 'Phetsarath-OT',
                                    )),
                              ),
                            ),
                          ).showCursorOnHover.moveUpOnhover,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      pc: service.length == 0
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "ບໍລິການ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Phetsarath-OT'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemCount: count >= service.length
                                ? service.length
                                : count,
                            itemBuilder: (contect, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 10,
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: CachedNetworkImage(
                                            imageUrl: url +
                                                service[index].images[0].url,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: ListView(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(service[index].title,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontFamily:
                                                          'Phetsarath-OT',
                                                    )),
                                                Text(service[index].content,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'Phetsarath-OT',
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // ignore: deprecated_member_use
                                          RaisedButton(
                                            onPressed: () {},
                                            color: menuselect,
                                            textColor: Colors.white,
                                            disabledColor: Colors.blue,
                                            disabledTextColor: Colors.white,
                                            disabledElevation: 4,
                                            elevation: 4,
                                            hoverColor: maincolor,
                                            padding: const EdgeInsets.all(14.0),
                                            child: Text("ເພີ່ມເຕີມ",
                                                style: TextStyle(
                                                  color: colormenu,
                                                  fontSize: 16,
                                                  fontFamily: 'Phetsarath-OT',
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              ).showCursorOnHover.moveUpOnhover;
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // ignore: deprecated_member_use
                          Card(
                            elevation: 10,
                            child: Container(
                              width: 200,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    if (count >= service.length) {
                                      count = service.length;
                                    } else {
                                      count += 3;
                                    }
                                  });
                                },
                                color: menuselect,
                                textColor: Colors.white,
                                disabledColor: Colors.blue,
                                disabledTextColor: Colors.white,
                                disabledElevation: 4,
                                elevation: 4,
                                hoverColor: maincolor,
                                padding: const EdgeInsets.all(14.0),
                                child: Text("ເບີ່ງເພີ່ມເຕີມ. . .",
                                    style: TextStyle(
                                      color: colormenu,
                                      fontSize: 16,
                                      fontFamily: 'Phetsarath-OT',
                                    )),
                              ),
                            ),
                          ).showCursorOnHover.moveUpOnhover,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    )));
  }
}
