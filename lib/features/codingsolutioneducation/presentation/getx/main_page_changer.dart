import 'package:get/get.dart';

class PageIndexController extends GetxController {
  var index = 0.obs;

  void setIndex(int i) {
    index = i as RxInt;
    update();
  }
}
