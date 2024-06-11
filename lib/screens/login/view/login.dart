import 'package:the_blackbridge_group/screens/auth/login/controller/login_controller.dart';
import 'package:the_blackbridge_group/stripe/stripe.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightBox(.1),
                Center(
                  child: Image.asset(
                    "assets/images/bl_trns.png",
                    height: kHeight(.12),
                  ),
                ),
                heightBox(0.07),
                CustomText(
                    alignText: TextAlign.left,
                    text: "Login Now",
                    textStyle: KTextStyles().normal(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        textColor: KColors.kPrimary)),
                CustomText(
                    alignText: TextAlign.left,
                    text: "Login to start Investing",
                    textStyle: KTextStyles().normal(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: KColors.kSecondary)),
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
                    prefixIcon: const Icon(null)),
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
                    prefixIcon: const Icon(null)),
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
                          text: "Log in",
                          function: () {
                            controller.login();
                          },
                        ),
                ),
                heightBox(.01),
                CustomText(
                    alignText: TextAlign.left,
                    text: "Forgot Password?",
                    textStyle: KTextStyles().normal(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textColor: KColors.kPrimary)),
                heightBox(.08),
                Align(
                  alignment: Alignment.center,
                  child: CustomRichText(
                    normalColor: KColors.kBlack,
                    focusedColor: KColors.kPrimary,
                    normalText: "Don't have an account? ",
                    focusedText: "Register Now",
                    nextpage: () {
                      Get.toNamed("/registeration");
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
