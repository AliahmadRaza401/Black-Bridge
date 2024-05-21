import '../widgets/widgets_imports.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            heightBox(.2),
            Image.asset(
              "assets/images/logo.png",
              height: kHeight(.15),
            ),
            const Spacer(),
            Container(
              height: kHeight(.5),
              width: context.width,
              decoration: BoxDecoration(
                  color: KColors.kPrimary,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(kWidth(.04)))),
              padding: EdgeInsets.all(kWidth(.08)),
              child: Column(
                children: [
                  CustomText(
                      alignText: TextAlign.left,
                      maxLines: 8,
                      text:
                          "• Exclusive investment opportunities\n• Above market returns\n• Access to opportunities prior to launch\n• Investment starts as a Pledge, no need to transfer funds\n• All live investments receive bonus enhancements\n• New avenues for growth and prosperity",
                      textStyle: KTextStyles().normal(
                          textColor: KColors.kWhite,
                          fontWeight: FontWeight.w500)),
                  heightBox(.04),
                  PrimaryButton(
                    height: 0.06,
                    fontsize: 18,
                    width: .8,
                    textcolor: KColors.kPrimary,
                    color: KColors.kWhite,
                    text: "Login your account",
                    function: () {
                      Get.toNamed("/login");
                    },
                  ),
                  heightBox(.04),
                  PrimaryButton(
                    height: 0.06,
                    fontsize: 18,
                    width: .8,
                    textcolor: KColors.kPrimary,
                    color: KColors.kWhite,
                    text: "Register New Account",
                    function: () {
                      Get.toNamed("/registeration");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
