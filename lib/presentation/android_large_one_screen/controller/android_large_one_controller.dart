import 'package:rohit_s_application2/core/app_export.dart';
import 'package:rohit_s_application2/presentation/android_large_one_screen/models/android_large_one_model.dart';

class AndroidLargeOneController extends GetxController {
  Rx<AndroidLargeOneModel> androidLargeOneModelObj = AndroidLargeOneModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(AppRoutes.androidLargeTwoScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
