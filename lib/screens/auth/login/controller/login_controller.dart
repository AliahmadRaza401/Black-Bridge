import 'package:image_picker/image_picker.dart';
import 'package:the_blackbridge_group/screens/auth/login/model/user_model.dart';
import 'package:the_blackbridge_group/screens/formpage/view/formpage.dart';
import 'package:the_blackbridge_group/screens/home/home.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();

  final passswordController = TextEditingController();

  RxBool loading = false.obs;
  setLoading(value) {
    loading.value = value;
    update();
  }

  login() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setLoading(true);

    try {
      final jsonData = {
        "email": emailController.text.toString().trim(),
        "password": passswordController.text.toString().trim(),
      };

      log(jsonData.toString());
      // Convert the JSON data to a string
      final body = jsonEncode(jsonData);

      var response = await http.post(
        Uri.parse(Apis.login),
        headers: {
          'Accept': 'application/json',
        },
        body: jsonData,
      );
      var result = jsonDecode(response.body);

      log("status Code: ${response.statusCode}");
      log('result: ${response.body}');

      if (response.statusCode.toString() == "200") {
        UserModel user = UserModel.fromJson(result);

        pref.setString("userData", jsonEncode(user));
        pref.setBool("isLogged", true);
        emailController.clear();
        passswordController.clear();
        Get.to(Home());
      } else {
        KSnackBar().errorSnackBar("Email Password is not correct");
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
