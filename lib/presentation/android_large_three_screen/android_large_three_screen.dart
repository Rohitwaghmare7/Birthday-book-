import 'package:intl/intl.dart';

import 'controller/android_large_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:rohit_s_application2/core/app_export.dart';
import 'package:rohit_s_application2/database/databaseServices.dart';

class AndroidLargeThreeScreen extends StatefulWidget {
  const AndroidLargeThreeScreen({Key? key}) : super(key: key);

  @override
  State<AndroidLargeThreeScreen> createState() => _MyWidgetState();
}

List<Card> cards = [];

class _MyWidgetState extends State<AndroidLargeThreeScreen> {
  late DatabaseServices db = DatabaseServices();
  DateTime? d = new DateTime.now();

  @override
  initState() {
    super.initState();
    db.initDatabase();
  }

  Future<List<Card>> getCards() async {
    cards.clear();
    var card = await db.selectAllrecord();

    setState(() {
      for (var i = 0; i < card.length; i++) {
        Map<String, Object?> element = card[i];

        var message = element['message'];
        var name = element['name'];
        var no = element['no'];
        var date = element['dt'];

        // var dateTime = DateTime.parse("$date");
        // DateTime now = DateTime.parse("$date");
        // String formattedDate = DateFormat.yMMMEd().format(now);

        cards.add(Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 30,
            color: ColorConstant.pinkA700,
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "$name",
                    style: AppStyle.txtPoppinsSemiBold23,
                  ),
                  subtitle: Text(
                    "$date",
                    style: AppStyle.txtPoppinsSemiBold23,
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(235, 255, 255, 255)),
                        onPressed: () {
                          db.deletefriend(name.toString());
                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ))
                  ],
                )
              ],
            )));
      }
    });

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Birthdays 🎂",
            style: AppStyle.txtPoppinsSemiBold23,
          ),
          backgroundColor: ColorConstant.pinkA700,
        ),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      children: cards,
                    ),
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(235, 195, 50, 195)),
                      onPressed: () {
                        setState(() {
                          getCards();
                        });
                      },
                      child: Text(
                        "click",
                        style: AppStyle.txtPoppinsSemiBold23,
                      ))
                ],
              ),
              // Expanded(
              //     child: SingleChildScrollView(
              //         child: Container(
              //             child: Stack(
              //                 alignment: Alignment.bottomRight,
              //                 children: [])))),
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
                                color: ColorConstant.pinkA700,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(28.00)))),
                        CustomImageView(
                            svgPath: ImageConstant.imgGroup7WhiteA70090x117,
                            height: getVerticalSize(96.00),
                            width: getHorizontalSize(117.00),
                            alignment: Alignment.bottomRight,
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
                            margin: getMargin(bottom: 20),
                            onTap: () {
                              onTapImgCalendar();
                            }),
                        CustomImageView(
                          svgPath: ImageConstant.imgMap,
                          height: getVerticalSize(31.00),
                          width: getHorizontalSize(27.00),
                          alignment: Alignment.bottomRight,
                          margin: getMargin(right: 45, bottom: 68),
                        )
                      ])),
                ],
              )
            ])));
  }

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.androidLargeTwoScreen);
  }

  onTapImghome() {
    Get.toNamed(AppRoutes.androidLargeOneScreen);
  }
}
