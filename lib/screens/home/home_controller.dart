import 'package:the_blackbridge_group/screens/auth/login/model/investment_model.dart';
import 'package:the_blackbridge_group/screens/auth/login/model/user_model.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  UserModel? user;
  getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? userRaw = pref.getString("userData");
    user = UserModel.fromJson(jsonDecode(userRaw!) as Map<String, dynamic>);
    update();
  }

  RxBool loading = false.obs;
  setLoading(value) {
    loading.value = value;
    update();
  }

  var investmentPlanList = <InvestmentModel>[].obs;

  getInvestiments() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setLoading(true);

    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final String? userRaw = pref.getString("userData");
      final UserModel user =
          UserModel.fromJson(jsonDecode(userRaw!) as Map<String, dynamic>);
      var response = await http.get(
        Uri.parse(Apis.investmentPlans),
        headers: {
          'Authorization': 'Bearer ${user.data.token}',
          'Accept': 'application/json',
        },
      );
      var result = jsonDecode(response.body);

      log("status Code: ${response.statusCode}");
      log('result: ${response.body}');

      if (response.statusCode.toString() == "200") {
        List data = result['data'].toList();
        investmentPlanList.clear();
        data.forEach((map) {
          investmentPlanList.add(InvestmentModel.fromJson(map));
        });

        print(investmentPlanList.length);
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
