
import 'dart:convert';
import 'package:ddba/view/widget.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ddba/model/PaymentModel.dart';
// import 'package:sslcommerz_flutter/model/SSLCSdkType.dart';
// import 'package:sslcommerz_flutter/model/SSLCTransactionInfoModel.dart';
// import 'package:sslcommerz_flutter/model/SSLCommerzInitialization.dart';
// import 'package:sslcommerz_flutter/model/SSLCurrencyType.dart';
// import 'package:sslcommerz_flutter/sslcommerz.dart';

import '../model/ReceiptModel.dart';
import 'package:flutter/material.dart';


class DBService {
  Future<List<Data>?> getPaymentDetails() async {
    final response = await http.get(
        Uri.parse(
            'https://beta-dtba.btla.net/api/bank/receipt?receipt_number=180001'),
        headers: {
          'Content-type': 'application/json',
          'instance-api-secrete': "k8wscw04kwwok4gcwsk488o4sog8o00gsgwsog0k",
          'instance-name': 'sibldtba459807',
        });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      PaymentModel paymentModel = PaymentModel.fromJson(json);
      return paymentModel.data;
    } else {
      throw Exception(
          'Failed to load ... status code:${response.statusCode}\n${response.body}');
    }
  }



  // getReceipt(BuildContext context) async {
  //   Sslcommerz sslcommerz = Sslcommerz(
  //       initializer: SSLCommerzInitialization(
  //            ipn_url: "https://beta-dtba.btla.net/dashboard",
  //           multi_card_name: "visa,master,bkash",
  //           currency: SSLCurrencyType.BDT,
  //           product_category: "Food",
  //           sdkType: SSLCSdkType.TESTBOX,
  //           store_id: "dtbab6224f97017631",
  //           store_passwd: "dtbab6224f97017631@ssl",
  //           total_amount: 3244.0,
  //           tran_id: "custom_transaction_id"));
  //
  //   //Store ID: dtbab6224f97017631
  //   // Store Password (API/Secret Key): dtbab6224f97017631@ssl
  //   //
  //   // final response = await http.get(
  //   //     Uri.parse('https://beta-dtba.btla.net/api/bank/receipt'),
  //   //     headers: {
  //   //       'Content-type': 'application/json',
  //   //       'instance-api-secrete': "k8wscw04kwwok4gcwsk488o4sog8o00gsgwsog0k",
  //   //       'instance-name': 'sibldtba459807',
  //   //     });
  //   // print(response.statusCode.toString()+"<<<<<<<<<<<<<get status>>>>>>>>>>ok");
  //   // if (response.statusCode == 200) {
  //   //   final json = jsonDecode(response.body);
  //   //   ReceiptModel receiptModel = ReceiptModel.fromJson(json);
  //   //   return receiptModel;
  //   // } else if (response.statusCode == 404) {
  //   //   final json = jsonDecode(response.body);
  //   //
  //
  //   var result = await sslcommerz.payNow();
  //   var model;
  //   if (result is PlatformException) {
  //     print("the response is: " + result.message!.toString()  + " code: " + result.code);
  //   } else {
  //      model = result;
  //   }
  // }
}

// "instance": "weascent608691",
//     "key": "sogkc4ww84gokc4wkkk0oooc84040k8s8g04c8sc"
// }
// 2:36
// Receipt Details
// API LINK
// https://beta-dtba.btla.net/api/bank/receipt?receipt_number=180001
// HTTP Method
// GET
// Parameters
// Name Validation Note
// receipt_number required
// Example
// Success Scenario
// curl -X GET \
//  'https://beta-dtba.btla.net/api/bank/receipt?receipt_number=180001' \
//  -H 'cache-control: no-cache' \
//  -H 'instance-api-secrete: k8wscw04kwwok4gcwsk488o4sog8o00gsgwsog0k' \
//  -H 'instance-name: sibldtba459807' \
//  -H 'postman-token: 15ed6c67-be88-c8b5-7481-fa3a261f8a0d'
// Response 200
// {
//  "status": true,
//  "data": [
//  {
//  "id": "1",
//  "receipt_number": "180001",
//  "receipt_date": "19-12-2018",
//  "start_date": "2018-01-01",
//  "finish_date": "2018-06-30",
//  "month_period": "6",
//  "total_amount": "3240.00",
//  "status": "PAID",
//  "member_id": "7629",
//  "membership_number": "M01055",
//  "member_name": "Mr. Manotosh Roy",
// 6
//  "member_mobile_number": "01916-385440"
//  }
//  ]
// }
// Failure Scenario
// curl -X GET \
//  https://beta-dtba.btla.net/api/bank/receipt \
//  -H 'cache-control: no-cache' \
//  -H 'instance-api-secrete: k8wscw04kwwok4gcwsk488o4sog8o00gsgwsog0k' \
//  -H 'instance-name: sibldtba459807' \
//  -H 'postman-token: 9c4779e2-9091-ecab-c34a-18a45a9aecbd'
// Response 404
// {
//  "status": false,
//  "data": null,
//  "message": "Could not find any receipt "
// }
//
//
//
//
//
// 2:40
// image.png
// image.png
//
//
// 2:41
// Store ID: dtbab6224f97017631
// Store Password (API/Secret Key): dtbab6224f97017631@ssl
// Merchant Panel URL: https://sandbox.sslcommerz.com/manage/
// (Credential as you inputted in the time of registration)
// Store name: testdtbabmty1
// Registered URL: http://portal.btla.net
// Session API to generate transaction: https://sandbox.sslcommerz.com/gwprocess/v3/api.php
// Validation API: https://sandbox.sslcommerz.com/validator/api/validationserverAPI.php?wsdl
// Validation API (Web Service) name: https://sandbox.sslcommerz.com/validator/api/validationserverAPI.php