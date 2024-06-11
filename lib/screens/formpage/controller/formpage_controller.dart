import 'package:the_blackbridge_group/screens/auth/login/model/user_model.dart';
import 'package:the_blackbridge_group/screens/home/home.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';
import 'package:http/http.dart' as http;

class FormPageController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final usdController = TextEditingController(text: " 000");
  RxBool box1 = RxBool(false);
  RxBool box2 = RxBool(false);
  RxBool box3 = RxBool(false);
  var selectedOption = 0.obs;
  var selectedOption1 = 0.obs;
  var selectedOption2 = 0.obs;
  var selectedOption3 = 0.obs;
  var selectedOption4 = 0.obs;

  // value
  var selectedOptionVAL = "".obs;
  var selectedOption1VAL = "".obs;
  var selectedOption2VAL = "".obs;
  var selectedOption3VAL = "".obs;
  var selectedOption4VAL = "".obs;
  void setSelectedOption(int value, VAL) {
    selectedOption.value = value;
    selectedOptionVAL.value = VAL;
    update();
  }

  void setSelectedOption1(int value, VAL) {
    selectedOption1.value = value;
    selectedOption1VAL.value = VAL;
    update();
  }

  void setSelectedOption2(int value, VAL) {
    selectedOption2.value = value;
    selectedOption2VAL.value = VAL;
    update();
  }

  void setSelectedOption3(int value, VAL) {
    selectedOption3.value = value;
    selectedOption3VAL.value = VAL;
    update();
  }

  void setSelectedOption4(int value, VAL) {
    selectedOption4.value = value;
    selectedOption4VAL.value = VAL;
    update();
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

  RxBool loading = false.obs;
  setLoading(value) {
    loading.value = value;
    update();
  }

  formSubmit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setLoading(true);

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final String? userRaw = pref.getString("userData");
      final UserModel user =
          UserModel.fromJson(jsonDecode(userRaw!) as Map<String, dynamic>);

      final jsonData = {
        "name": fullNameController.text.toString(),
        "phone": phoneController.text.toString(),
        "email": emailController.text.toString(),
        "date": "2021-12-08 11:35",
        "alternative_investment": "${selectedOptionVAL}",
        "type_investment": "${selectedOption1VAL}",
        "investment_term": "${selectedOption2VAL}",
        "qualify_investor": "${selectedOption3VAL}",
        "invest_next_3_month": "yes",
        //  "${selectedOption4VAL}",
        "investment_amount": usdController.text,
        "completed_question": "1",
        "paid_fee": "1",
        "membership_approvel": "1"
      };

      log(jsonData.toString());
      // Convert the JSON data to a string
      final body = jsonEncode(jsonData);

      var response = await http.post(
        Uri.parse(Apis.membership),
        headers: {
          'Authorization': 'Bearer ${user.data.token}',
          'Accept': 'application/json',
        },
        body: jsonData,
      );

      var result = jsonDecode(response.body);

      log("status Code: ${response.statusCode}");
      log('result: ${response.body}');

      if (response.statusCode.toString() == "201") {
        Get.to(Home());
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool("membership", true);

        KSnackBar().successSnackBar("Membership created Successfully");
      } else {
        KSnackBar().errorSnackBar("Oops! something is wrong");
      }
      setLoading(false);
    } catch (e) {
      log('e: $e');
      KSnackBar().errorSnackBar("${e.toString()}");

      setLoading(false);

      return e.toString();
    }
  }
}
