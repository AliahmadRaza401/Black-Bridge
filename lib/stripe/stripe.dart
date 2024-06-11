import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:tribe_event/screens/user/home/Controller/home_controller.dart';
import 'package:tribe_event/utils/app_toast.dart';
import 'package:http/http.dart' as http;

import 'api_constants.dart';

class StripePaymentHandle {
  String STRIPE_SECRET =
      'sk_test_51PAuR4L0LhVOzMcJn8nyxv2eCcg1B2gu1HI2qkCF2QFuSjMor1Zt34Ae9pv8aX2SSVnjoHITqBtsnOQF9kKNTLoP00HkGFkJPe';
  String STRIPE_PUBLISHABLE =
      "pk_test_51PAuR4L0LhVOzMcJjzvloWpit2fvae0KxMfDz0Ob0wuoLHDlBnHhntRP4BGh60WnKwpGvE8DPjBSyuzgcDJLZq1F000XNjhero";

  Map<String, dynamic>? paymentIntent;
  String paymentid = '';

  Future<bool> stripeMakePayment({String amount = '',bool isBuy=false}) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      paymentid = paymentIntent!['id'];
      if(!isBuy) {
        HomeController controller = Get.find();
        controller.updateCardId('1',paymentid);
      }
      ApiConstants.paymentId=paymentid;
      // controller.updateCardId(paymentid);
      print('payment id from stripe class $paymentid');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  billingDetails: const BillingDetails(
                      name: 'Tribe event',
                      email: 'tribeEvent@gmail.com',
                      phone: '0032023032',
                      address: Address(
                          city: 'YOUR CITY',
                          country: 'YOUR COUNTRY',
                          line1: 'YOUR ADDRESS 1',
                          line2: 'YOUR ADDRESS 2',
                          postalCode: 'YOUR PINCODE',
                          state: 'YOUR STATE')),
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Ikay'))
          .then((value) {
        print('payment information $value');
      });
      //STEP 3: Display Payment sheet
      return displayPaymentSheet();
    } on StripeConfigException catch (e) {
      print(e.message);
      appToast(e.message);
      return false;
    } catch (e) {
      print(e.toString());
      appToast(e.toString());
      return false;
    }
  }

  Future<bool> displayPaymentSheet() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      appToast('Payment successfully completed');
      return true;
    } on Exception catch (e) {
      if (e is StripeException) {
        appToast('Error from Stripe: ${e.error.localizedMessage}');
      } else {
        appToast('Unforeseen error: ${e}');
      }
      return false;
    }
  }

//create Payment
  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $STRIPE_SECRET',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

//calculate Amount
  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }
}
