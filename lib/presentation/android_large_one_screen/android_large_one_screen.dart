import 'controller/android_large_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:rohit_s_application2/core/app_export.dart';

class AndroidLargeOneScreen extends GetWidget<AndroidLargeOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Container(
                        decoration: AppDecoration.fillPurpleA100.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderBL67),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgGroup,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text("lbl_welcome_to".tr,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsSemiBold26)),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Text("lbl_friends".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtPoppinsRegular58))),
                              CustomImageView(
                                  svgPath: ImageConstant.imgObjects,
                                  height: getVerticalSize(136.00),
                                  width: getHorizontalSize(261.00),
                                  alignment: Alignment.center,
                                  margin: getMargin(top: 20, bottom: 57))
                            ]))
                  ]),
                  Container(
                      child: Text("msg_add_birthday_for".tr,
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtPoppinsRegular18)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                    height: getVerticalSize(68.00),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.teal300,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(28.00)))),
                                CustomImageView(
                                    svgPath: ImageConstant.imgGroup7,
                                    height: getVerticalSize(96.00),
                                    width: getHorizontalSize(117.00),
                                    alignment: Alignment.bottomLeft,
                                    margin: getMargin(bottom: 23)),
                                CustomImageView(
                                  svgPath: ImageConstant.imgHomeWhiteA700,
                                  height: getSize(31.00),
                                  width: getSize(31.00),
                                  alignment: Alignment.bottomLeft,
                                  margin: getMargin(left: 45, bottom: 70),
                                ),
                                CustomImageView(
                                    svgPath: ImageConstant.imgCalendar,
                                    height: getSize(31.00),
                                    width: getSize(31.00),
                                    margin: getMargin(bottom: 15),
                                    onTap: () {
                                      onTapImgCalendar();
                                    }),
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
                ])));
  }

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.androidLargeTwoScreen);
  }

  onTapImgMap() {
    Get.toNamed(AppRoutes.androidLargeThreeScreen);
  }
}
