
import 'package:flutter/material.dart';
import 'package:myoffice/controller/service.dart';
import 'package:http/http.dart' as http;
import 'package:myoffice/models/aboutmd.dart';
import 'package:myoffice/responsive/runningapprespon.dart';
import 'package:myoffice/theme/theme.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var url = Url.url;
  final List<AboutMd> about = [];
  Future getdata() async {
    try {
      var data = await http.get(Uri.parse('$url/abouts'));
      if (data.statusCode == 200) {
        var jsonData = data.body;
        // var list = json.decode(jsonData) as List;
        //  List<AboutMd> values = list.map((e) => AboutMd.fromJson(e)).toList();
        List<AboutMd> listimage = aboutMdFromJson(jsonData);
        return listimage;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getdata().then((value) {
      setState(() {
        about.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ResponsiveWidget(
        mobile: about == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: about.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        TextTitle(
                          text: about[index].title,
                          color: colorback,
                          size: 22,
                          fontWeight: FontWeight.bold,
                          font: 'Phetsarath-OT',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextTitle(
                          text: about[index].company.toUpperCase(),
                          color: colorback,
                          size: 18,
                          fontWeight: FontWeight.bold,
                          font: 'times',
                        ),
                        TextTitle(
                          text: about[index].content,
                          color: colorback,
                          size: 16,
                          fontWeight: FontWeight.normal,
                          font: 'Phetsarath-OT',
                        ),
                      ],
                    ),
                  );
                },
              ),
        tablet: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: about == null
                    ? Center(child: CircularProgressIndicator())
                    : about.length,
                itemBuilder: (context, index) {
                  AboutMd item = about[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          TextTitle(
                            text: item.title,
                            color: colorback,
                            size: 25,
                            fontWeight: FontWeight.bold,
                            font: 'Phetsarath-OT',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextTitle(
                            text: item.company.toUpperCase(),
                            color: colorback,
                            size: 25,
                            fontWeight: FontWeight.bold,
                            font: 'times',
                          ),
                          TextTitle(
                            text: item.content,
                            color: colorback,
                            size: 20,
                            fontWeight: FontWeight.normal,
                            font: 'Phetsarath-OT',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        pc: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: about == null
                    ? Center(child: CircularProgressIndicator())
                    : about.length,
                itemBuilder: (context, index) {
                  AboutMd item = about[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          TextTitle(
                            text: item.title,
                            color: colorback,
                            size: 25,
                            fontWeight: FontWeight.bold,
                            font: 'Phetsarath-OT',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextTitle(
                            text: item.company.toUpperCase(),
                            color: colorback,
                            size: 25,
                            fontWeight: FontWeight.bold,
                            font: 'times',
                          ),
                          TextTitle(
                            text: item.content,
                            color: colorback,
                            size: 20,
                            fontWeight: FontWeight.normal,
                            font: 'Phetsarath-OT',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

class TextTitle extends StatelessWidget {
  final String text;
  final String font;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  const TextTitle({
    Key key,
    this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.font,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: font),
    );
  }
}
