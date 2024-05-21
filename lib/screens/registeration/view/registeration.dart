import 'package:the_blackbridge_group/screens/registeration/controller/registeration_controller.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';

class Registeration extends StatelessWidget {
  Registeration({super.key});

  final Registeration2Controller controller =
      Get.put(Registeration2Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  heightBox(.1),
                  CustomText(
                      alignText: TextAlign.left,
                      text: "Create Account",
                      textStyle: KTextStyles().normal(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          textColor: KColors.kPrimary)),
                  CustomText(
                      alignText: TextAlign.left,
                      text: "Register Your Account to start Investment",
                      textStyle: KTextStyles().normal(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: KColors.kSecondary)),
                  heightBox(.02),
                  CustomText(
                      alignText: TextAlign.left,
                      text: "First Name",
                      textStyle: KTextStyles().normal(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: KColors.kPrimary)),
                  heightBox(0.01),
                  CustomTextField(
                    themeColor: const Color(0xffCDCDCD),
                    hasSuffix: false,
                    hasPrefix: false,
                    controller: controller.firstnameController,
                    label: "Enter First Name",
                    hintText: "",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(null),
                    prefixIcon: const Icon(null),
                    function: (value) {
                      if (value!.isEmpty) {
                        return "Enter First Name";
                      }
                      return null;
                    },
                  ),
                  heightBox(.02),
                  CustomText(
                      alignText: TextAlign.left,
                      text: "Last Name",
                      textStyle: KTextStyles().normal(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: KColors.kPrimary)),
                  heightBox(0.01),
                  CustomTextField(
                    themeColor: const Color(0xffCDCDCD),
                    hasSuffix: false,
                    hasPrefix: false,
                    controller: controller.lastnameController,
                    label: "Enter Last Name",
                    hintText: "",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(null),
                    prefixIcon: const Icon(null),
                    function: (value) {
                      if (value!.isEmpty) {
                        return "Enter Last Name";
                      }
                      return null;
                    },
                  ),
                  heightBox(.02),
                  CustomText(
                      alignText: TextAlign.left,
                      text: "Email Address",
                      textStyle: KTextStyles().normal(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: KColors.kPrimary)),
                  heightBox(0.01),
                  CustomTextField(
                    themeColor: const Color(0xffCDCDCD),
                    hasSuffix: false,
                    hasPrefix: false,
                    controller: controller.emailController,
                    label: "Enter Email Address",
                    hintText: "",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(null),
                    prefixIcon: const Icon(null),
                    function: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email Address";
                      }
                      return null;
                    },
                  ),
                  heightBox(.02),
                  CustomText(
                      alignText: TextAlign.left,
                      text: "Phone Number",
                      textStyle: KTextStyles().normal(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: KColors.kPrimary)),
                  heightBox(0.01),
                  CustomTextField(
                    themeColor: const Color(0xffCDCDCD),
                    hasSuffix: false,
                    hasPrefix: false,
                    controller: controller.phoneController,
                    label: "Enter Phone Number",
                    hintText: "",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(null),
                    prefixIcon: const Icon(null),
                    function: (value) {
                      if (value!.isEmpty) {
                        return "Enter Phone Number";
                      }
                      return null;
                    },
                  ),
                  heightBox(.02),
                  CustomText(
                      alignText: TextAlign.left,
                      text: "Password",
                      textStyle: KTextStyles().normal(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: KColors.kPrimary)),
                  heightBox(0.01),
                  CustomTextField(
                    themeColor: const Color(0xffCDCDCD),
                    hasSuffix: false,
                    hasPrefix: false,
                    controller: controller.passswordController,
                    label: "Enter Password",
                    hintText: "",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(null),
                    prefixIcon: const Icon(null),
                    function: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (value.length < 8) {
                        return "Password must be 8 char";
                      }
                      return null;
                    },
                  ),
                  heightBox(.05),
                  PrimaryButton(
                    height: 0.06,
                    fontsize: 18,
                    width: .9,
                    textcolor: KColors.kWhite,
                    color: KColors.kPrimary,
                    text: "Next",
                    function: () {
                      if (!controller.formKey.currentState!.validate()) {
                        return;
                      } else {
                        Get.toNamed("/Registeration2");
                      }
                    },
                  ),
                  heightBox(.01),
                  heightBox(.03),
                  Align(
                    alignment: Alignment.center,
                    child: CustomRichText(
                      normalColor: KColors.kBlack,
                      focusedColor: KColors.kPrimary,
                      normalText: "Already have an account? ",
                      focusedText: "Login Now",
                      nextpage: () {
                        Get.toNamed("/login");
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
