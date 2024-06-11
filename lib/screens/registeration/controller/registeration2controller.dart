import 'package:image_picker/image_picker.dart';
import 'package:the_blackbridge_group/screens/auth/login/model/user_model.dart';
import 'package:the_blackbridge_group/screens/formpage/view/formpage.dart';
import 'package:the_blackbridge_group/screens/home/home.dart';
import 'package:the_blackbridge_group/screens/login/view/login.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';
import 'package:http/http.dart' as http;

class Registeration2Controller extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final phoneController = TextEditingController();
  final lastnameController = TextEditingController();
  final passswordController = TextEditingController();

  final RxString profileImg = RxString("");
  final RxString passportImg = RxString("");
  final RxString cnicImg = RxString("");
  final RxString drivingLImg = RxString("");

  final Rxn<File> image = Rxn<File>();
  final RxnString imageEdit = RxnString();

  // final Rxn<File> image2 = Rxn<File>();
  // final RxnString image2Edit = RxnString();

  // final Rxn<File> image3 = Rxn<File>();
  // final RxnString image3Edit = RxnString();
  RxBool loading = false.obs;

  setLoading(value) {
    loading.value = value;
    update();
  }

  Future pickFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1200,
      maxWidth: 1080,
    );

    var imagePath = pickedFile == null ? null : File(pickedFile.path);
    if (imagePath != null) {
      imageEdit.value = null;

      image.value = File(imagePath.path);

      File rotatedImage =
          await FlutterExifRotation.rotateImage(path: image.value!.path);

      var tempprofileImg = await convertToBase64(rotatedImage);
      return tempprofileImg;
    }
  }

  Future pickFromCamera() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 40,
      maxHeight: 1200,
      maxWidth: 1080,
    );

    var imagePath = pickedFile == null ? null : File(pickedFile.path);
    if (imagePath != null) {
      imageEdit.value = null;

      image.value = File(imagePath.path);

      File rotatedImage =
          await FlutterExifRotation.rotateImage(path: image.value!.path);

      var tempprofileImg = await convertToBase64(rotatedImage);
      return tempprofileImg;
    }
  }

  singUp() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setLoading(true);

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Apis.register),
      );
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
      });
      request.fields['email'] = emailController.text.trim();
      request.fields['name'] = firstnameController.text.trim();
      // request.fields['country'] = "";
      request.fields['phone'] = phoneController.text.trim();
      request.fields['password'] = passswordController.text.trim();

      if (profileImg.value.contains('cache')) {
        final file = File(profileImg.value);
        request.files
            .add(await http.MultipartFile.fromPath('avatar', file.path));
        debugPrint('updating the file');
      } else {
        request.fields['avatar'] = profileImg.value;
      }

      if (passportImg.value.contains('cache')) {
        final file = File(passportImg.value);
        request.files
            .add(await http.MultipartFile.fromPath('f_passport', file.path));
        debugPrint('updating the file');
      } else {
        request.fields['f_passport'] = passportImg.value;
      }

      // if (passportImg.value.contains('cache')) {
      //   final file = File(passportImg.value);
      //   request.files
      //       .add(await http.MultipartFile.fromPath('b_passport', file.path));
      //   debugPrint('updating the file');
      // } else {
      //   request.fields['b_passport'] = passportImg.value;
      // }

      if (cnicImg.value.contains('cache')) {
        final file = File(cnicImg.value);
        request.files
            .add(await http.MultipartFile.fromPath('f_cnic', file.path));
        debugPrint('updating the file');
      } else {
        request.fields['f_cnic'] = cnicImg.value;
      }

      // if (cnicImg.value.contains('cache')) {
      //   final file = File(cnicImg.value);
      //   request.files
      //       .add(await http.MultipartFile.fromPath('b_cnic', file.path));
      //   debugPrint('updating the file');
      // } else {
      //   request.fields['b_cnic'] = cnicImg.value;
      // }

      if (drivingLImg.value.contains('cache')) {
        final file = File(drivingLImg.value);
        request.files.add(
            await http.MultipartFile.fromPath('f_driving_licence', file.path));
        debugPrint('updating the file');
      } else {
        request.fields['f_driving_licence'] = drivingLImg.value;
      }

      // if (drivingLImg.value.contains('cache')) {
      //   final file = File(drivingLImg.value);
      //   request.files.add(
      //       await http.MultipartFile.fromPath('b_driving_licence', file.path));
      //   debugPrint('updating the file');
      // } else {
      //   request.fields['b_driving_licence'] = drivingLImg.value;
      // }

      log(request.fields.toString());
      log(request.files.toString());

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var result = jsonDecode(response.body);

      log("status Code: ${response.statusCode}");
      log('result: ${response.body}');

      if (result['status'].toString() != "failed") {
        UserModel user = UserModel.fromJson(result);

        pref.setString("userData", jsonEncode(user));
        KSnackBar().successSnackBar("Account Created Successfully!");
        Get.to(Home());
        emailController.clear();
      } else {
        KSnackBar().errorSnackBar("${result['data'].toString()}");
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
