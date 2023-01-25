import 'package:get/get.dart';
import 'package:weather_app/screens/home_screen.dart';

class ChangeTempController extends GetxController {
  int temp = 15;
  increseTemprature() {
    temp += 1;
    update();
  }

  decreaseTemprature(){
temp-=1;
update();
  }

  navigateToHome(){
    Get.to(() => HomeScreen());
  }
}
