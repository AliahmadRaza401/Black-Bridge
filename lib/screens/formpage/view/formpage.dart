import 'package:the_blackbridge_group/screens/formpage/controller/formpage_controller.dart';
import 'package:the_blackbridge_group/widgets/app_widgets.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});
  final FormPageController controller = Get.put(FormPageController());
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
                CustomText(
                    alignText: TextAlign.left,
                    text: "Full Name",
                    textStyle: KTextStyles().normal(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        textColor: KColors.kPrimary)),
                heightBox(0.01),
                CustomTextField(
                  themeColor: const Color(0xffCDCDCD),
                  hasSuffix: false,
                  hasPrefix: false,
                  controller: controller.fullNameController,
                  label: "Enter Last Name",
                  hintText: "",
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: const Icon(null),
                  prefixIcon: const Icon(null),
                  // function: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Enter Full Name";
                  //   }
                  //   return null;
                  // },
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
                  // function: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Enter Email Address";
                  //   }
                  //   return null;
                  // },
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
                  // function: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Enter Phone Number";
                  //   }
                  //   return null;
                  // },
                ),
                heightBox(.02),
                CustomText(
                    alignText: TextAlign.left,
                    maxLines: 2,
                    text:
                        "Please answer the following investment survey so we can offer you suitable investment opportunities",
                    textStyle: KTextStyles().normal()),
                heightBox(.02),
                CustomText(
                    alignText: TextAlign.left,
                    maxLines: 3,
                    text:
                        "Are you interested in Alternative Investments that offer above-market returns however may carry increased risk?",
                    textStyle: KTextStyles().normal(fontSize: 16)),
                Obx(() => KRadio(
                      title: "Yes",
                      value: 1,
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) {
                        controller.setSelectedOption(value!);
                        return null;
                      },
                    )),
                Obx(() => KRadio(
                      title: "No",
                      value: 2,
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) {
                        controller.setSelectedOption(value!);
                        return null;
                      },
                    )),
                CustomText(
                    alignText: TextAlign.left,
                    maxLines: 2,
                    text: "What type of investments are you interested in?",
                    textStyle: KTextStyles().normal(fontSize: 16)),
                Obx(() => KRadio(
                      title: "Promissioary note",
                      value: 1,
                      groupValue: controller.selectedOption1.value,
                      onChanged: (value) {
                        controller.setSelectedOption1(value!);
                        return null;
                      },
                    )),
                Obx(() => KRadio(
                      title: "Equity",
                      value: 2,
                      groupValue: controller.selectedOption1.value,
                      onChanged: (value) {
                        controller.setSelectedOption1(value!);
                        return null;
                      },
                    )),
                Obx(() => KRadio(
                      title: 'Hybrid',
                      value: 3,
                      groupValue: controller.selectedOption1.value,
                      onChanged: (value) {
                        controller.setSelectedOption1(value!);
                        return null;
                      },
                    )),
                CustomText(
                    alignText: TextAlign.left,
                    maxLines: 2,
                    text: "What investment term would best suit you?",
                    textStyle: KTextStyles().normal(fontSize: 16)),
                Obx(() => KRadio(
                      title: "Under 6 Months",
                      value: 1,
                      groupValue: controller.selectedOption2.value,
                      onChanged: (value) {
                        controller.setSelectedOption2(value!);
                        return null;
                      },
                    )),
                Obx(() => KRadio(
                      title: "6-12 Months",
                      value: 2,
                      groupValue: controller.selectedOption2.value,
                      onChanged: (value) {
                        controller.setSelectedOption2(value!);
                        return null;
                      },
                    )),
                Obx(() => KRadio(
                      title: '12+ Months',
                      value: 3,
                      groupValue: controller.selectedOption2.value,
                      onChanged: (value) {
                        controller.setSelectedOption2(value!);
                        return null;
                      },
                    )),
                CustomText(
                    alignText: TextAlign.left,
                    maxLines: 2,
                    text:
                        "Do you qualify as an Accredited/Sophisticated Investor?",
                    textStyle: KTextStyles().normal(fontSize: 16)),
                Obx(() => KRadio(
                      title: "Yes",
                      value: 1,
                      groupValue: controller.selectedOption3.value,
                      onChanged: (value) {
                        controller.setSelectedOption3(value!);
                        return null;
                      },
                    )),
                Obx(() => KRadio(
                      title: "No",
                      value: 2,
                      groupValue: controller.selectedOption3.value,
                      onChanged: (value) {
                        controller.setSelectedOption3(value!);
                        return null;
                      },
                    )),
                CustomText(
                    alignText: TextAlign.left,
                    maxLines: 3,
                    text:
                        "Would you be capable and willing to invest within the next 3 months?",
                    textStyle: KTextStyles().normal(fontSize: 16)),
                Obx(() => KRadio(
                      title: "Yes",
                      value: 1,
                      groupValue: controller.selectedOption4.value,
                      onChanged: (value) {
                        controller.setSelectedOption4(value!);
                        return null;
                      },
                    )),
                Obx(() => KRadio(
                      title: "No",
                      value: 2,
                      groupValue: controller.selectedOption4.value,
                      onChanged: (value) {
                        controller.setSelectedOption4(value!);
                        return null;
                      },
                    )),
                CustomText(
                    alignText: TextAlign.left,
                    text: "What would be your typical investment amount?*",
                    textStyle: KTextStyles().normal(fontSize: 16)),
                heightBox(.008),
                Row(
                  children: [
                    CustomText(
                        text: "USD",
                        textStyle: KTextStyles().normal(fontSize: 18)),
                    widthBox(.02),
                    SizedBox(
                      height: kHeight(.07),
                      width: kWidth(.25),
                      child: CustomTextField(
                          hasSuffix: false,
                          hasPrefix: false,
                          themeColor: KColors.kPrimary,
                          controller: controller.usdController,
                          label: "",
                          hintText: "",
                          keyboardType: TextInputType.number,
                          suffixIcon: const Icon(null),
                          prefixIcon: const Icon(null)),
                    )
                  ],
                ),
                heightBox(.1),
                CustomText(
                    alignText: TextAlign.left,
                    maxLines: 3,
                    text:
                        "This will assist us in offering you suitable investments and also to achieve your super enhancement bonus",
                    textStyle: KTextStyles().normal(fontSize: 18)),
                Obx(() {
                  return KCheckList(
                    value: controller.box1.value,
                    title: "I have completed the above questionnaire",
                    onChanged: (value) {
                      controller.checkbox1();
                      return false;
                    },
                  );
                }),
                Obx(() {
                  return KCheckList(
                    value: controller.box2.value,
                    title:
                        "I have paid my annual Memberhsip fee of USD \$750.00",
                    onChanged: (value) {
                      controller.checkbox2();
                      return false;
                    },
                  );
                }),
                Obx(() {
                  return KCheckList(
                      onChanged: (value) {
                        controller.checkbox3();
                        return false;
                      },
                      value: controller.box3.value,
                      title:
                          "I am required to provide current AML/KYC documents and proof of funds for membership approval");
                }),
                heightBox(.05),
                PrimaryButton(
                  height: 0.06,
                  fontsize: 18,
                  width: .9,
                  textcolor: KColors.kWhite,
                  color: KColors.kPrimary,
                  text: "Submit",
                  function: () {},
                ),
                heightBox(.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
