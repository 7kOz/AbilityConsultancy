import 'package:get/get.dart';

class MovementController extends GetxController {
  bool livingRoom = true;
  bool garden = true;
  bool canteen = true;
  bool office = true;

  void toggleLivingRoom() {
    livingRoom = !livingRoom;
    update();
  }

  void toggleGarden() {
    garden = !garden;
    update();
  }

  void toggleCanteen() {
    canteen = !canteen;
    update();
  }

  void toggleoffice() {
    office = !office;
    update();
  }
}
