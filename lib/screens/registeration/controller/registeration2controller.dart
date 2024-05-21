import 'package:image_picker/image_picker.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';

class Registeration2Controller extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxString base64Image = RxString("");
  final RxString base64Image1 = RxString("");
  final RxString base64Image2 = RxString("");

  final Rxn<File> image = Rxn<File>();
  final RxnString imageEdit = RxnString();

  // final Rxn<File> image2 = Rxn<File>();
  // final RxnString image2Edit = RxnString();

  // final Rxn<File> image3 = Rxn<File>();
  // final RxnString image3Edit = RxnString();

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

      var tempBase64Image = await convertToBase64(rotatedImage);
      return tempBase64Image;
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

      var tempBase64Image = await convertToBase64(rotatedImage);
      return tempBase64Image;
    }
  }

  // Future pickFromCam() async {
  //   var pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     maxHeight: 1200,
  //     maxWidth: 1080,
  //   );

  //   var imagePath = pickedFile == null ? null : File(pickedFile.path);
  //   if (imagePath != null) {
  //     imageEdit.value = null;

  //     image.value = File(imagePath.path);

  //     File rotatedImage =
  //         await FlutterExifRotation.rotateImage(path: image.value!.path);

  //     image.value = await compressImage(rotatedImage);
  //   }
  // }

  // Future pickFromGallery() async {
  //   var pickedFile2 = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxHeight: 1200,
  //     maxWidth: 1080,
  //   );

  //   var imagePath2 = pickedFile2 == null ? null : File(pickedFile2.path);
  //   if (imagePath2 != null) {
  //     image2Edit.value = null;

  //     image2.value = File(imagePath2.path);

  //     File rotatedImage =
  //         await FlutterExifRotation.rotateImage(path: image2.value!.path);

  //     image2.value = await compressImage(rotatedImage);
  //   }

  //   var pickedFile3 = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxHeight: 1200,
  //     maxWidth: 1080,
  //   );

  //   var imagePath3 = pickedFile3 == null ? null : File(pickedFile3.path);
  //   if (imagePath3 != null) {
  //     image3Edit.value = null;

  //     image3.value = File(imagePath3.path);

  //     File rotatedImage =
  //         await FlutterExifRotation.rotateImage(path: image3.value!.path);

  //     image3.value = await compressImage(rotatedImage);
  //   }
  // }
}
