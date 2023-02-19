import 'package:rohit_s_application2/database/FriendsData.dart';
import 'controller/android_large_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:rohit_s_application2/core/app_export.dart';
import 'package:intl/intl.dart';
import 'package:rohit_s_application2/database/databaseServices.dart';

class AndroidLargeTwoScreen extends StatefulWidget {
  const AndroidLargeTwoScreen({Key? key}) : super(key: key);

  @override
  State<AndroidLargeTwoScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AndroidLargeTwoScreen> {
  DateTime? d1 = new DateTime.now();
  String? date = "Hey!!";

  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();
  TextEditingController t3 = new TextEditingController();

  List<friends> friend = [];

  DatabaseServices db = DatabaseServices();
  @override
  void initState() {
    super.initState();
    db.initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          appBar: AppBar(
            title:
                Text("Add your friends", style: AppStyle.txtPoppinsSemiBold23),
            backgroundColor: ColorConstant.purple500,
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Name",
                            style: AppStyle.txtPoppinsSemiBold26,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextField(
                          controller: t1,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 3,
                                color: ColorConstant.purple500,
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: ColorConstant.purple500,
                                ),
                              ),
                              label: Text(
                                'Name',
                                style: TextStyle(color: Colors.black),
                              ),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Phone Number",
                            style: AppStyle.txtPoppinsSemiBold26,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: TextField(
                          controller: t2,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 3,
                                color: ColorConstant.purple500,
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: ColorConstant.purple500,
                                ),
                              ),
                              label: Text(
                                'Number',
                                style: TextStyle(color: Colors.black),
                              ),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Message ❤️",
                            style: AppStyle.txtPoppinsSemiBold26,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
                        child: TextField(
                          controller: t3,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 3,
                                color: ColorConstant.purple500,
                              )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: ColorConstant.purple500,
                                ),
                              ),
                              label: Text(
                                'Write something',
                                style: TextStyle(color: Colors.black),
                              ),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConstant.purple500),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2032))
                                    .then((value) {
                                  if (value == null) return null;
                                  String d1 =
                                      DateFormat('yyyy-MM-dd').format(value);
                                  setState(() {
                                    date = d1;
                                  });
                                });
                              },
                              child: Text("Date",
                                  style: AppStyle.txtPoppinsSemiBold23)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConstant.purple500),
                              onPressed: () {
                                setState(() {
                                  var f1 = friends(
                                      name: t1.text,
                                      no: int.parse(t2.text),
                                      message: t3.text,
                                      dt: date.toString());
                                  db.insertFriends(f1);
                                  friend.add(f1);
                                });
                              },
                              child: Text("Save",
                                  style: AppStyle.txtPoppinsSemiBold23))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        width: 180,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorConstant.purple500,
                            border: Border.all(
                              width: 3,
                              color: ColorConstant.purple500,
                            )),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            "$date",
                            style: AppStyle.txtPoppinsSemiBold23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        alignment: Alignment.bottomCenter,
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Container(
                              height: getVerticalSize(68.00),
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: ColorConstant.purple500,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(28.00)))),
                          CustomImageView(
                              svgPath: ImageConstant.imgGroup7WhiteA700,
                              height: getVerticalSize(96.00),
                              width: getHorizontalSize(117.00),
                              alignment: Alignment.bottomCenter,
                              margin: getMargin(bottom: 23)),
                          CustomImageView(
                            svgPath: ImageConstant.imgHomeWhiteA700,
                            height: getSize(31.00),
                            width: getSize(31.00),
                            alignment: Alignment.bottomLeft,
                            margin: getMargin(left: 55, bottom: 20),
                            onTap: () {
                              onTapImghome();
                            },
                          ),
                          CustomImageView(
                            svgPath: ImageConstant.imgCalendar,
                            height: getSize(31.00),
                            width: getSize(31.00),
                            alignment: Alignment.bottomCenter,
                            margin: getMargin(bottom: 65),
                          ),
                          CustomImageView(
                              svgPath: ImageConstant.imgMap,
                              height: getVerticalSize(31.00),
                              width: getHorizontalSize(27.00),
                              alignment: Alignment.bottomRight,
                              margin: getMargin(right: 50, bottom: 18),
                              onTap: () {
                                onTapImgMap();
                              })
                        ])),
                  ],
                )
              ])),
    );
    ;
  }

  onTapImgMap() {
    Get.toNamed(AppRoutes.androidLargeThreeScreen);
  }

  onTapImghome() {
    Get.toNamed(AppRoutes.androidLargeOneScreen);
  }
}
