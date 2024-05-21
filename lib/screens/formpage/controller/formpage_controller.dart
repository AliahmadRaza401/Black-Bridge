import 'package:the_blackbridge_group/widgets/widgets_imports.dart';

class FormPageController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final usdController = TextEditingController(text: " ,000");
  RxBool box1 = RxBool(false);
  RxBool box2 = RxBool(false);
  RxBool box3 = RxBool(false);
  var selectedOption = 0.obs;
  var selectedOption1 = 0.obs;
  var selectedOption2 = 0.obs;
  var selectedOption3 = 0.obs;
  var selectedOption4 = 0.obs;

  void setSelectedOption(int value) {
    selectedOption.value = value;
  }

  void setSelectedOption1(int value) {
    selectedOption1.value = value;
  }

  void setSelectedOption2(int value) {
    selectedOption2.value = value;
  }

  void setSelectedOption3(int value) {
    selectedOption3.value = value;
  }

  void setSelectedOption4(int value) {
    selectedOption4.value = value;
  }

  void checkbox1() {
    box1.value = !box1.value;
  }

  void checkbox2() {
    box2.value = !box2.value;
  }

  void checkbox3() {
    box3.value = !box3.value;
  }
}
