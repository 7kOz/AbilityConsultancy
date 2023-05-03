import 'package:get/get_state_manager/get_state_manager.dart';

class StoreController extends GetxController {
  bool firstPage = true;
  bool secondPage = false;

  onFirstPage() {
    firstPage = true;
    secondPage = false;
    update();
  }

  onSecondPage() {
    firstPage = false;
    secondPage = true;
    update();
  }
}
