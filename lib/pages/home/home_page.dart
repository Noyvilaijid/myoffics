import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myoffice/controller/service.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myoffice/models/homemd.dart';
import 'package:myoffice/responsive/runningapprespon.dart';
import 'package:myoffice/theme/theme.dart';

var url = Url.url;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<HomeMd> images = [];
  Future gethomedata() async {
    try {
      var data = await http.get(Uri.parse('$url/homepages'));
      if (data.statusCode == 200) {
        var jsonData = data.body;
        List<HomeMd> listimage = homeMdFromJson(jsonData);
        return listimage;
      }
    } catch (e) {
      print(e);
    }
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    super.initState();
    gethomedata().then((value) {
       setState(() {
       images.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: ResponsiveWidget(
        mobile: images.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: entry.key == _current
                                        ? menuselect
                                      : colorback),
                              ),
                            );
                          }).toList(),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        height: MediaQuery.of(context).size.height / 1.5,
                      ),
                      items: images.map((e) {
                        return ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                CachedNetworkImage(
                                  imageUrl: url + e.localimage[0].url,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    width:
                                        MediaQuery.of(context).size.width / 1,
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
                                Positioned(
                                  bottom: 20,
                                  left: 10,
                                  right: 0.0,
                                  child: Text(
                                    e.titlepage,
                                    style: TextStyle(
                                      color: colortitle,
                                      fontSize: 20,
                                      fontFamily: 'Phetsarath-OT',
                                    ),
                                  ),
                                ),
                              ],
                            ));
                      }).toList(),
                    ),
                  )
                ],
              ),
        tablet: images.length == 0
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: entry.key == _current
                                         ? menuselect
                                      : colorback),
                              ),
                            );
                          }).toList(),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height / 1.2,
                    width: double.infinity,
                    child: Container(
                        child: CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                         setState(() {
                            _current = index;
                          });
                        },
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                      ),
                      items: images.map((e) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl: url + e.localimage[0].url,
                                    imageBuilder: (context, imageProvider) =>
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
                                  Positioned(
                                    bottom: 20,
                                    left: 10,
                                    right: 0.0,
                                    child: Text(
                                      e.titlepage,
                                      style: TextStyle(
                                        color: colorback,
                                        fontSize: 16,
                                        fontFamily: 'Phetsarath-OT',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      }).toList(),
                    )),
                  )
                ],
              ),
        pc: images.length == 0
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.asMap().entries.map((entry) {
                            return Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: entry.key == _current
                                      ? menuselect
                                      : colorback),
                            );
                          }).toList(),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(16),
                      height: 550,
                      width: width,
                      child: Container(
                          child: CarouselSlider(
                        options: CarouselOptions(
                            onPageChanged: (index, reason) {
                             setState(() {
                                _current = index;
                              });
                            },
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                            viewportFraction: 1,
                            height: 540),
                        items: images.map((e) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 150),
                            child: Container(
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      CachedNetworkImage(
                                        imageUrl: url + e.localimage[0].url,
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
                                      Positioned(
                                        bottom: 25,
                                        left: 10,
                                        right: 0.0,
                                        child: Text(
                                          e.titlepage,
                                          style: TextStyle(
                                            color: colorback,
                                            fontSize: 16,
                                            fontFamily: 'Phetsarath-OT',
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }).toList(),
                      )))
                ],
              ),
      )),
    );
  }
}
