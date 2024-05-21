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
              key: controller.formKey,
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
                  controller.image.value == null
                      ? PrimaryButton(
                          text: "Attach File",
                          function: () async {
                            controller.base64Image.value =
                                await controller.pickFromCamera();
                            controller.update();
                          },
                        )
                      : Obx(() {
                          return SizedBox(
                            width: kWidth(.38),
                            height: kHeight(.2),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: kWidth(.36),
                                    height: kHeight(.18),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: KColors.kPrimary,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(kWidth(.03)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: KColors.kWhite.withOpacity(.2),
                                          blurRadius: 8,
                                          offset: const Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(kWidth(.01)),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(kWidth(.028)),
                                      child: Image.memory(
                                        base64Decode(
                                            controller.base64Image.value),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                if (controller.imageEdit.value != null ||
                                    controller.imageEdit.value != "" &&
                                        controller.image.value != null)
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        controller.imageEdit.value = null;
                                        controller.image.value = null;
                                        controller.update();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: KColors.kPrimary,
                                        radius: kWidth(.034),
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: KColors.kWhite,
                                          size: kWidth(.06),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }),
                  heightBox(.02),
                  CustomText(
                    text: "Passport picture *",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  heightBox(.01),
                  controller.image.value == null
                      ? PrimaryButton(
                          text: "Attach File",
                          function: () async {
                            controller.base64Image1.value =
                                await controller.pickFromGallery();
                          },
                        )
                      : Obx(() {
                          return SizedBox(
                            width: kWidth(.38),
                            height: kHeight(.2),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: kWidth(.36),
                                    height: kHeight(.18),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: KColors.kPrimary,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(kWidth(.03)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: KColors.kWhite.withOpacity(.2),
                                          blurRadius: 8,
                                          offset: const Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(kWidth(.01)),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(kWidth(.028)),
                                      child: Image.memory(
                                        base64Decode(
                                            controller.base64Image1.value),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                if (controller.base64Image1.value != "")
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        controller.base64Image1.value = "";
                                        controller.base64Image1.value = "";
                                        controller.base64Image1.value = "";
                                        controller.update();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: KColors.kPrimary,
                                        radius: kWidth(.034),
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: KColors.kWhite,
                                          size: kWidth(.06),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }),
                  heightBox(.02),
                  CustomText(
                    text: "CNIC Picture *",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  heightBox(.01),
                  controller.image.value == null
                      ? PrimaryButton(
                          text: "Attach File",
                          function: () async {
                            controller.base64Image2.value =
                                await controller.pickFromGallery();
                          },
                        )
                      : Obx(() {
                          return SizedBox(
                            width: kWidth(.38),
                            height: kHeight(.2),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: kWidth(.36),
                                    height: kHeight(.18),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: KColors.kPrimary,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(kWidth(.03)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: KColors.kWhite.withOpacity(.2),
                                          blurRadius: 8,
                                          offset: const Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(kWidth(.01)),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(kWidth(.028)),
                                      child: Image.memory(
                                        base64Decode(
                                            controller.base64Image2.value),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                if (controller.base64Image2.value != "")
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        controller.base64Image2.value = "";
                                        controller.base64Image2.value = "";
                                        controller.update();
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: KColors.kPrimary,
                                        radius: kWidth(.034),
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: KColors.kWhite,
                                          size: kWidth(.06),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }),
                  heightBox(.05),
                  PrimaryButton(
                    height: 0.06,
                    fontsize: 18,
                    width: .9,
                    textcolor: KColors.kWhite,
                    color: KColors.kPrimary,
                    text: "Create Account",
                    function: () {
                      if (!controller.formKey.currentState!.validate()) {
                        return;
                      } else if (controller.base64Image.value == "") {
                        return KSnackBar()
                            .errorSnackBar("Please Provide Live Selfe");
                      } else if (controller.base64Image1.value == "") {
                        return KSnackBar()
                            .errorSnackBar("Please Provide Passport Picture");
                      } else if (controller.base64Image2.value == "") {
                        KSnackBar().errorSnackBar("Please Provide CNIC");
                      } else {
                        Get.toNamed("/formpage");
                      }
                    },
                  ),
                  heightBox(.01),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
