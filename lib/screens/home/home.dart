import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_blackbridge_group/screens/auth/login/model/investment_model.dart';
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
                margin: EdgeInsets.symmetric(horizontal: 20),
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
  InvestmentModel invest;
  InvestmentCard({required this.invest});

  @override
  State<InvestmentCard> createState() => _InvestmentCardState();
}

class _InvestmentCardState extends State<InvestmentCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
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
          selected == true
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = true;
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CustomText(
                            text: "Yes! i'm interested",
                            textStyle: KTextStyles().normal(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                textColor: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = true;
                            print('selected: ${selected}');
                          });
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CustomText(
                            text: "Not this time",
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
}
