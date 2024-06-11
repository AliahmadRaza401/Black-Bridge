import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_blackbridge_group/screens/auth/login/model/investment_model.dart';
import 'package:the_blackbridge_group/screens/formpage/view/formpage.dart';
import 'package:the_blackbridge_group/screens/home/home_controller.dart';
import 'package:the_blackbridge_group/screens/login/view/login.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    homeController.getUserData();
    homeController.getInvestiments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    heightBox(.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text:
                              "Wellcome! ${controller.user == null ? "" : controller.user!.detail.name}",
                          textStyle: KTextStyles().normal(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.setBool("isLogged", false);
                              Get.offAll(Login());
                            },
                            child: Icon(Icons.logout)),
                      ],
                    ),
                    heightBox(.02),
                    controller.loading.value
                        ? loader()
                        : Expanded(
                            child: ListView.builder(
                                itemCount: controller.investmentPlanList.length,
                                itemBuilder: (context, i) {
                                  InvestmentModel invest =
                                      controller.investmentPlanList[i];
                                  return InvestmentCard(
                                    invest: invest,
                                    controller: controller,
                                  );
                                })),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class InvestmentCard extends StatefulWidget {
  final InvestmentModel invest;
  final HomeController controller;

  InvestmentCard({required this.invest, required this.controller});

  @override
  State<InvestmentCard> createState() => _InvestmentCardState();
}

class _InvestmentCardState extends State<InvestmentCard> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.8),
      ),
      child: Column(
        children: [
          investmentTile(
            "Investment Type",
            "${widget.invest.investmentType}",
          ),
          investmentTile(
            "Term",
            "${widget.invest.term}",
          ),
          investmentTile(
            "Rate",
            "${widget.invest.rate}",
          ),
          investmentTile(
            "Mini Investment",
            "${widget.invest.minInvestment}",
          ),
          investmentTile(
            "Other Points",
            "${widget.invest.otherPoints}",
          ),
          investmentTile(
            "Issure Type",
            "${widget.invest.issureType}",
          ),
          investmentTile(
            "Jurisdication",
            "${widget.invest.jurisdication}",
          ),
          investmentTile(
            "Security",
            "${widget.invest.security}",
          ),
          investmentTile(
            "Industry",
            "${widget.invest.industry}",
          ),
          investmentTile(
            "Use Of Fund",
            "${widget.invest.useOfFund}",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading
                    ? CircularProgressIndicator(
                        color: Colors.red,
                      )
                    : GestureDetector(
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();

                          var membership = pref.getBool("membership");
                          print('membership: $membership');
                          if (membership == true) {
                            setState(() {
                              isLoading = true;
                            });
                            await widget.controller
                                .userInterestedPlan(widget.invest.id);
                            setState(() {
                              isLoading = false;
                            });
                          } else {
                            showMembershipAlertDialog();
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CustomText(
                            text: "Yes! I'm interested",
                            textStyle: KTextStyles().normal(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                textColor: Colors.white),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget investmentTile(title, val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: title,
              textStyle: KTextStyles().normal(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  textColor: Colors.white),
            ),
          ),
          Expanded(
            child: CustomText(
              text: val,
              textStyle: KTextStyles().normal(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  textColor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void showMembershipAlertDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white, // Set the background color to white
        title: Text(
          'Membership Required',
          style: TextStyle(
              color: Colors.black), // Set the title text color to black
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You do not have membership. Please apply before submitting',
              style: TextStyle(
                  color: Colors.black), // Set the content text color to black
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CustomText(
                      text: "Cancel",
                      textStyle: KTextStyles().normal(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: Colors.black),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.to(FormPage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CustomText(
                      text: "Okay",
                      textStyle: KTextStyles().normal(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          textColor: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
