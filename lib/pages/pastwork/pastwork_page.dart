import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myoffice/controller/service.dart';
import 'package:myoffice/models/pastwork.dart';
import 'package:myoffice/responsive/runningapprespon.dart';
import 'package:http/http.dart' as http;
import 'package:myoffice/theme/theme.dart';

class PastWork extends StatefulWidget {
  const PastWork({Key key}) : super(key: key);
  @override
  _PastWorkState createState() => _PastWorkState();
}

class _PastWorkState extends State<PastWork> {
  var url = Url.url;
  final List<Pastwork> pastwork = [];
  Future getdata() async {
    try {
      var data = await http.get(Uri.parse('$url/pastworks'));
      if (data.statusCode == 200) {
        var jsonData = data.body;
        List<Pastwork> listimage = pastworkFromJson(jsonData);
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
        pastwork.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWidget(
          mobile: pastwork.length == 0
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "ຜົນງານຂອງພວກເຮົາ",
                        style: TextStyle(
                            fontSize: 22,
                            color: colorback,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Phetsarath-OT'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CarouselSlider.builder(
                          itemCount: pastwork.length,
                          itemBuilder: (context, index, realIndex) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: builderImage(
                                      pastwork.length == 0
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : pastwork[index].image[0].url,
                                      index),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      pastwork[index].title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colorback,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'times'),
                                    ),
                                    Text(
                                      pastwork[index].content,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: colorback,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Phetsarath-OT'),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                          options: CarouselOptions(
                              height: MediaQuery.of(context).size.height / 1.5,
                              autoPlay: true,
                              // reverse: true,
                              viewportFraction: 1,
                              autoPlayInterval: Duration(seconds: 5)))
                    ],
                  ),
                ),
          tablet: pastwork.length == 0
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "ຜົນງານຂອງພວກເຮົາ",
                        style: TextStyle(
                            fontSize: 22,
                            color: colorback,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Phetsarath-OT'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CarouselSlider.builder(
                          itemCount: pastwork.length,
                          itemBuilder: (context, index, realIndex) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: builderImage(
                                      pastwork.length == 0
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : pastwork[index].image[0].url,
                                      index),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      pastwork[index].title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colorback,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'times'),
                                    ),
                                    Text(
                                      pastwork[index].content,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: colorback,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Phetsarath-OT'),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                          options: CarouselOptions(
                              height: 450,
                              autoPlay: true,
                              // reverse: true,
                              viewportFraction: 1,
                              autoPlayInterval: Duration(seconds: 5)))
                    ],
                  ),
                ),
          pc: pastwork.length == 0
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "ຜົນງານຂອງພວກເຮົາ",
                        style: TextStyle(
                            fontSize: 22,
                            color: colorback,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Phetsarath-OT'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CarouselSlider.builder(
                          itemCount: pastwork.length,
                          itemBuilder: (context, index, realIndex) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: builderImage(
                                      pastwork.length == 0
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : pastwork[index].image[0].url,
                                      index),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      pastwork[index].title,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: colorback,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'times'),
                                    ),
                                    Text(
                                      pastwork[index].content,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: colorback,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Phetsarath-OT'),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                          options: CarouselOptions(
                              height: 550,
                              autoPlay: true,

                              // reverse: true,
                              viewportFraction: 1,
                              autoPlayInterval: Duration(seconds: 5)))
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget builderImage(String urls, int index) => Container(
        height: 550,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: CachedNetworkImage(
          imageUrl: url + urls,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );
}
