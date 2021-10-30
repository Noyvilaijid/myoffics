// ignore_for_file: deprecated_member_use
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:myoffice/controller/service.dart';
import 'package:myoffice/responsive/runningapprespon.dart';
import 'package:myoffice/theme/theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key key}) : super(key: key);
  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  GlobalKey<FormState> _forekey = GlobalKey<FormState>();
  CalendarController _controller;
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController organize = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  String date;
  var url = Url.url;
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  Future insertdata(String name, String sur, String organ, String phone,
      String email, String datetime) async {
    try {
      final String urls = "$url/meetings";
      final respon = await http.post(
        Uri.parse(urls),
        headers: headers,
        body: jsonEncode({
          "Name": name,
          "Surename": sur,
          "Organization": organ,
          "Phone": phone,
          "Email": email,
          "Datetime": datetime
        }),
      );
      return respon.statusCode;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _controller = CalendarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWidget(
          mobile: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ນັດມື້ເຂົ້າພົບ",
                  style: TextStyle(
                      fontSize: 25,
                      color: colorback,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Phetsarath-OT'),
                ),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      "assets/bestech.png",
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 350,
                    height: 150,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TableCalendar(
                              calendarStyle: CalendarStyle(
                                  todayStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      fontFamily: 'times'),
                                  todayColor: colorRED,
                                  selectedColor:
                                      Theme.of(context).primaryColorDark),
                              calendarController: _controller,
                              startingDayOfWeek: StartingDayOfWeek.sunday,
                              onDaySelected: (day, events, holidays) {
                                date = day.toIso8601String();
                              },
                              builders: CalendarBuilders(
                                selectedDayBuilder: (context, date, events) =>
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: colortitle,
                                            shape: BoxShape.circle),
                                        child: Text(
                                          date.day.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'times'),
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(
                      physics: AlwaysScrollableScrollPhysics(),
                      children: [
                        Form(
                          key: _forekey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text("ຂໍ້ມູນຜູ້ເຂົ້າພົບ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: colorback,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Phetsarath-OT')),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                cursorColor: colorback,
                                controller: name,
                                decoration: InputDecoration(
                                    labelText: "ຊື່",
                                    fillColor: colorback,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )),
                                style: TextStyle(
                                    fontFamily: 'Phetsarath-OT',
                                    fontSize: 16,
                                    color: colorback,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "ຊື່ວ່າງເປົ່າ";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                cursorColor: colorback,
                                controller: surname,
                                decoration: InputDecoration(
                                    labelText: "ນາມສະກຸນ",
                                    fillColor: colorback,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )),
                                style: TextStyle(
                                    fontFamily: 'Phetsarath-OT',
                                    fontSize: 16,
                                    color: colorback,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "ນາມສະກຸນວ່າງເປົ່າ";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                cursorColor: colorback,
                                controller: organize,
                                decoration: InputDecoration(
                                    labelText: "ອົງກອນ",
                                    fillColor: colorback,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )),
                                style: TextStyle(
                                    fontFamily: 'Phetsarath-OT',
                                    fontSize: 16,
                                    color: colorback,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "ອົງກອນວ່າງເປົ່າ";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                cursorColor: colorback,
                                controller: phone,
                                decoration: InputDecoration(
                                    labelText: "ເບີໂທ",
                                    fillColor: colorback,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )),
                                style: TextStyle(
                                    fontFamily: 'times',
                                    fontSize: 16,
                                    color: colorback,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "ເບີໂທວ່າງເປົ່າ";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                cursorColor: colorback,
                                controller: email,
                                decoration: InputDecoration(
                                    labelText: "ອີເມລ",
                                    fillColor: colorback,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )),
                                style: TextStyle(
                                    fontFamily: 'times',
                                    fontSize: 16,
                                    color: colorback,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "ອີເມລວ່າງເປົ່າ";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  if (_forekey.currentState.validate()) {
                                    if (date == null) {
                                      date = DateTime.now().toIso8601String();
                                    }
                                    insertdata(
                                            name.text,
                                            surname.text,
                                            organize.text,
                                            phone.text,
                                            email.text,
                                            date.toString())
                                        .then((value) => {
                                              if (value == 200)
                                                {
                                                  AwesomeDialog(
                                                      context: context,
                                                      dismissOnTouchOutside:
                                                          false,
                                                      dialogType:
                                                          DialogType.SUCCES,
                                                      headerAnimationLoop:
                                                          false,
                                                      animType:
                                                          AnimType.TOPSLIDE,
                                                      title: 'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                      desc: 'ສຳເລັດແລ້ວ !',
                                                      btnOkOnPress: () {})
                                                    ..show(),
                                                }
                                              else if (value == 400)
                                                {
                                                  AwesomeDialog(
                                                      context: context,
                                                      dismissOnTouchOutside:
                                                          false,
                                                      dialogType:
                                                          DialogType.WARNING,
                                                      headerAnimationLoop:
                                                          false,
                                                      animType:
                                                          AnimType.TOPSLIDE,
                                                      title: 'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                      desc:
                                                          'ຮູບແບບຂອງ ອີເມລບໍ່ຖືກຕ້ອງ ?',
                                                      btnOkOnPress: () {})
                                                    ..show(),
                                                }
                                              else
                                                {
                                                  AwesomeDialog(
                                                      context: context,
                                                      dismissOnTouchOutside:
                                                          false,
                                                      dialogType:
                                                          DialogType.ERROR,
                                                      headerAnimationLoop:
                                                          false,
                                                      animType:
                                                          AnimType.TOPSLIDE,
                                                      title: 'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                      desc:
                                                          'ມີ ອີເມລນີ້ໃນລະບົບແລ້ວ ?',
                                                      btnOkOnPress: () {})
                                                    ..show(),
                                                }
                                            });
                                  }
                                },
                                color: colortitle,
                                child: Text("ສົ່ງຂໍ້ມູນ",
                                    style: TextStyle(
                                        fontFamily: 'Phetsarath-OT',
                                        fontSize: 16,
                                        color: colorwhite,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                // Container(
                //   color: Colors.blue,
                //   width: double.infinity,
                //   height: 40,
                //   child: Center(
                //     child: Text("Copyright @ 2021 Bestech All Rights Reserved",
                //         style: TextStyle(
                //             fontSize: 16,
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold,
                //             fontFamily: 'times')),
                //   ),
                // ),
              ],
            ),
          ),
          tablet: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ນັດມື້ເຂົ້າພົບ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Phetsarath-OT'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                  "assets/bestech.png",
                                  width: 150,
                                  height: 80,
                                ),
                              ),
                            ),
                            TableCalendar(
                              calendarStyle: CalendarStyle(
                                  todayStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'times'),
                                  todayColor: Colors.red,
                                  selectedColor: Colors.green),
                              calendarController: _controller,
                              startingDayOfWeek: StartingDayOfWeek.monday,
                              onDaySelected: (day, events, holidays) {
                                date = day.toIso8601String();
                              },
                              builders: CalendarBuilders(
                                selectedDayBuilder: (context, date, events) =>
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle),
                                        child: Text(
                                          date.day.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'times'),
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        height: 500,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Form(
                                key: _forekey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("ຂໍ້ມູນຜູ້ເຂົ້າພົບ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Phetsarath-OT')),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: name,
                                      decoration: InputDecoration(
                                          labelText: "ຊື່",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'Phetsarath-OT',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ຊື່ວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: surname,
                                      decoration: InputDecoration(
                                          labelText: "ນາມສະກຸນ",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'Phetsarath-OT',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ນາມສະກຸນວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: organize,
                                      decoration: InputDecoration(
                                          labelText: "ອົງກອນ",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'Phetsarath-OT',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ອົງກອນວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: phone,
                                      decoration: InputDecoration(
                                          labelText: "ເບີໂທ",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'times',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ເບີໂທວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: email,
                                      decoration: InputDecoration(
                                          labelText: "ອີເມລ",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'times',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ອີເມລວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        if (_forekey.currentState.validate()) {
                                          if (date == null) {
                                            date = DateTime.now()
                                                .toIso8601String();
                                          }
                                          insertdata(
                                                  name.text,
                                                  surname.text,
                                                  organize.text,
                                                  phone.text,
                                                  email.text,
                                                  date.toString())
                                              .then((value) => {
                                                    if (value == 200)
                                                      {
                                                        AwesomeDialog(
                                                            context: context,
                                                            dismissOnTouchOutside:
                                                                false,
                                                            dialogType:
                                                                DialogType
                                                                    .SUCCES,
                                                            headerAnimationLoop:
                                                                false,
                                                            animType: AnimType
                                                                .TOPSLIDE,
                                                            title:
                                                                'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                            desc:
                                                                'ສຳເລັດແລ້ວ !',
                                                            btnOkOnPress: () {})
                                                          ..show(),
                                                      }
                                                    else if (value == 400)
                                                      {
                                                        AwesomeDialog(
                                                            context: context,
                                                            dismissOnTouchOutside:
                                                                false,
                                                            dialogType:
                                                                DialogType
                                                                    .WARNING,
                                                            headerAnimationLoop:
                                                                false,
                                                            animType: AnimType
                                                                .TOPSLIDE,
                                                            title:
                                                                'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                            desc:
                                                                'ຮູບແບບຂອງ ອີເມລບໍ່ຖືກຕ້ອງ ?',
                                                            btnOkOnPress: () {})
                                                          ..show(),
                                                      }
                                                    else
                                                      {
                                                        AwesomeDialog(
                                                            context: context,
                                                            dismissOnTouchOutside:
                                                                false,
                                                            dialogType:
                                                                DialogType
                                                                    .ERROR,
                                                            headerAnimationLoop:
                                                                false,
                                                            animType: AnimType
                                                                .TOPSLIDE,
                                                            title:
                                                                'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                            desc:
                                                                'ມີ ອີເມລນີ້ໃນລະບົບແລ້ວ ?',
                                                            btnOkOnPress: () {})
                                                          ..show(),
                                                      }
                                                  });
                                        }
                                      },
                                      color: colorgray,
                                      child: Text("ສົ່ງຂໍ້ມູນ",
                                          style: TextStyle(
                                              fontFamily: 'Phetsarath-OT',
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Expanded(
                //   child: Container(
                //     color: Colors.blue,
                //     width: double.infinity,
                //     child: Center(
                //       child: Text(
                //           "Copyright @ 2021 Bestech All Rights Reserved",
                //           style: TextStyle(
                //               fontSize: 20,
                //               color: Colors.black,
                //               fontWeight: FontWeight.bold,
                //               fontFamily: 'times')),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          pc: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ນັດມື້ເຂົ້າພົບ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Phetsarath-OT'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: 350,
                        height: 450,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                "assets/bestech.png",
                                width: 150,
                                height: 80,
                              ),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    TableCalendar(
                                      rowHeight: 50,
                                      calendarStyle: CalendarStyle(
                                          todayStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              fontFamily: 'times'),
                                          todayColor: Colors.red,
                                          selectedColor: Colors.green),
                                      calendarController: _controller,
                                      startingDayOfWeek:
                                          StartingDayOfWeek.monday,
                                      onDaySelected: (day, events, holidays) {
                                        date = day.toIso8601String();
                                      },
                                      builders: CalendarBuilders(
                                        selectedDayBuilder:
                                            (context, date, events) =>
                                                Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        shape: BoxShape.circle),
                                                    child: Text(
                                                      date.day.toString(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'times'),
                                                    )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 500,
                        width: 350,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Form(
                                key: _forekey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("ຂໍ້ມູນຜູ້ເຂົ້າພົບ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Phetsarath-OT')),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: name,
                                      decoration: InputDecoration(
                                          labelText: "ຊື່",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'Phetsarath-OT',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ຊື່ວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: surname,
                                      decoration: InputDecoration(
                                          labelText: "ນາມສະກຸນ",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'Phetsarath-OT',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ນາມສະກຸນວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: organize,
                                      decoration: InputDecoration(
                                          labelText: "ອົງກອນ",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'Phetsarath-OT',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ອົງກອນວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: phone,
                                      decoration: InputDecoration(
                                          labelText: "ເບີໂທ",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'times',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ເບີໂທວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      cursorColor: Colors.black,
                                      controller: email,
                                      decoration: InputDecoration(
                                          labelText: "ອີເມລ",
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      style: TextStyle(
                                          fontFamily: 'times',
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "ອີເມລວ່າງເປົ່າ";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        if (_forekey.currentState.validate()) {
                                          if (date == null) {
                                            date = DateTime.now()
                                                .toIso8601String();
                                          }
                                          insertdata(
                                                  name.text,
                                                  surname.text,
                                                  organize.text,
                                                  phone.text,
                                                  email.text,
                                                  date.toString())
                                              .then((value) => {
                                                    if (value == 200)
                                                      {
                                                        AwesomeDialog(
                                                            context: context,
                                                            dismissOnTouchOutside:
                                                                false,
                                                            dialogType:
                                                                DialogType
                                                                    .SUCCES,
                                                            headerAnimationLoop:
                                                                false,
                                                            animType: AnimType
                                                                .TOPSLIDE,
                                                            title:
                                                                'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                            desc:
                                                                'ສຳເລັດແລ້ວ !',
                                                            btnOkOnPress: () {})
                                                          ..show(),
                                                      }
                                                    else if (value == 400)
                                                      {
                                                        AwesomeDialog(
                                                            context: context,
                                                            dismissOnTouchOutside:
                                                                false,
                                                            dialogType:
                                                                DialogType
                                                                    .WARNING,
                                                            headerAnimationLoop:
                                                                false,
                                                            animType: AnimType
                                                                .TOPSLIDE,
                                                            title:
                                                                'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                            desc:
                                                                'ຮູບແບບຂອງ ອີເມລບໍ່ຖືກຕ້ອງ ?',
                                                            btnOkOnPress: () {})
                                                          ..show(),
                                                      }
                                                    else
                                                      {
                                                        AwesomeDialog(
                                                            context: context,
                                                            dismissOnTouchOutside:
                                                                false,
                                                            dialogType:
                                                                DialogType
                                                                    .ERROR,
                                                            headerAnimationLoop:
                                                                false,
                                                            animType: AnimType
                                                                .TOPSLIDE,
                                                            title:
                                                                'ຂໍ້ຄວາມແຈ້ງເຕືອນ',
                                                            desc:
                                                                'ມີ ອີເມລນີ້ໃນລະບົບແລ້ວ ?',
                                                            btnOkOnPress: () {})
                                                          ..show(),
                                                      }
                                                  });
                                        }
                                      },
                                      color: colorgray,
                                      child: Text("ສົ່ງຂໍ້ມູນ",
                                          style: TextStyle(
                                              fontFamily: 'Phetsarath-OT',
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
