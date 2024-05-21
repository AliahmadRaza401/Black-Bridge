import 'package:the_blackbridge_group/screens/registeration/controller/registeration2controller.dart';
import 'package:the_blackbridge_group/widgets/custom_app_bar.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';

class Registeration2 extends StatelessWidget {
  Registeration2({super.key});
  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final phoneController = TextEditingController();
  final lastnameController = TextEditingController();
  final passswordController = TextEditingController();

  final Registeration2Controller controller =
      Get.put(Registeration2Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", actions: []),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: SingleChildScrollView(
            child: Form(
              // key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightBox(0.02),
                  CustomText(
                    text: "Live Selfie *",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  heightBox(.01),
                  // ignore: unnecessary_null_comparison
                  Obx(
                    () => controller.profileImg.value.isEmpty
                        ? PrimaryButton(
                            text: "Attach File",
                            function: () async {
                              // controller.getImage(ImageSource.camera);
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                controller.profileImg.value = pickedFile.path;
                              }
                            },
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                // backgroundColor: AppColors.primaryFuchsiaColor,
                                backgroundImage: FileImage(
                                    File(controller.profileImg.value)),
                                child: controller.profileImg.isEmpty
                                    ? Icon(Icons.person,
                                        size: 50, color: Colors.grey[200])
                                    : null,
                              ),
                            ],
                          ),
                  ),

                  heightBox(.02),

                  CustomText(
                    text: "Passport picture *",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  heightBox(.01),
                  Obx(
                    () => controller.passportImg.value.isEmpty
                        ? PrimaryButton(
                            text: "Attach File",
                            function: () async {
                              // controller.getImage(ImageSource.camera);
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                controller.passportImg.value = pickedFile.path;
                              }
                            },
                          )
                        : Container(
                            height: Get.height * 0.15,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                    File(controller.passportImg.value)),
                              ),
                            ),
                            child: controller.passportImg.isEmpty
                                ? Icon(Icons.person,
                                    size: 50, color: Colors.grey[200])
                                : null,
                          ),
                    // CircleAvatar(
                    //     radius: 50,
                    //     // backgroundColor: AppColors.primaryFuchsiaColor,
                    //     backgroundImage:
                    //         FileImage(File(controller.passportImg.value)),
                    // child: controller.passportImg.isEmpty
                    //     ? Icon(Icons.person,
                    //         size: 50, color: Colors.grey[200])
                    //     : null,
                    //   ),
                  ),
                  heightBox(.02),
                  CustomText(
                    text: "CNIC Picture *",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  heightBox(.01),
                  Obx(
                    () => controller.cnicImg.value.isEmpty
                        ? PrimaryButton(
                            text: "Attach File",
                            function: () async {
                              // controller.getImage(ImageSource.camera);
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                controller.cnicImg.value = pickedFile.path;
                              }
                            },
                          )
                        : Container(
                            height: Get.height * 0.15,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    FileImage(File(controller.cnicImg.value)),
                              ),
                            ),
                            child: controller.cnicImg.isEmpty
                                ? Icon(Icons.person,
                                    size: 50, color: Colors.grey[200])
                                : null,
                          ),
                  ),

                  heightBox(.02),
                  CustomText(
                    text: "Driving Licence Picture *",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  heightBox(.01),
                  Obx(
                    () => controller.drivingLImg.value.isEmpty
                        ? PrimaryButton(
                            text: "Attach File",
                            function: () async {
                              // controller.getImage(ImageSource.camera);
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                controller.drivingLImg.value = pickedFile.path;
                              }
                            },
                          )
                        : Container(
                            height: Get.height * 0.15,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                    File(controller.drivingLImg.value)),
                              ),
                            ),
                            child: controller.drivingLImg.isEmpty
                                ? Icon(Icons.person,
                                    size: 50, color: Colors.grey[200])
                                : null,
                          ),
                  ),

                  heightBox(.05),
                  Obx(
                    () => controller.loading.value
                        ? Center(child: loader())
                        : PrimaryButton(
                            height: 0.06,
                            fontsize: 18,
                            width: .9,
                            textcolor: KColors.kWhite,
                            color: KColors.kPrimary,
                            text: "Create Account",
                            function: () {
                              if (!controller.formKey.currentState!
                                  .validate()) {
                                return;
                              } else if (controller.profileImg.value == "") {
                                return KSnackBar()
                                    .errorSnackBar("Please Provide Live Selfe");
                              } else if (controller.passportImg.value == "") {
                                return KSnackBar().errorSnackBar(
                                    "Please Provide Passport Picture");
                              } else if (controller.cnicImg.value == "") {
                                KSnackBar()
                                    .errorSnackBar("Please Provide CNIC");
                              } else {
                                // Get.toNamed("/formpage");
                                controller.singUp();
                              }
                            },
                          ),
                  ),
                  heightBox(.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
