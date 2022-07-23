import 'dart:convert';

import 'package:ddba/view/widget.dart';
import 'package:http/http.dart' as http;
import 'package:ddba/model/PaymentModel.dart';

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
          'Failed to load ... statuscode:${response.statusCode}\n${response.body}');
    }
  }

  Future<ReceiptModel> getReceipt(BuildContext context) async {
    final response = await http.get(
        Uri.parse('https://beta-dtba.btla.net/api/bank/receipt'),
        headers: {
          'Content-type': 'application/json',
          'instance-api-secrete': "k8wscw04kwwok4gcwsk488o4sog8o00gsgwsog0k",
          'instance-name': 'sibldtba459807',
        });
    print(response.statusCode.toString()+"<<<<<<<<<<<<<get status>>>>>>>>>>ok");
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      ReceiptModel receiptModel = ReceiptModel.fromJson(json);
      return receiptModel;
    } else if (response.statusCode == 404) {
      final json = jsonDecode(response.body);
      ReceiptModel receiptModel = ReceiptModel.fromJson(json);

      showDialog(
        context: context,
        builder: (context)=>SizedBox(
          height: 200,
          width: 200,
          child: AlertDialog(
            actions: [
              TextButton(onPressed:(){
                Navigator.pop(context);
              }, child: Text("OK"))
            ],
            content: Container(
              height: 200,
              width: 200,
              // color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRichText(title: "status",data: receiptModel.status.toString(),),
                  CustomRichText(title: "data",data: receiptModel.data.toString(),),
                  CustomRichText(title: "message",data: receiptModel.message.toString(),),
                ],
              ),
            ),
          ),
        ),
      );
      return receiptModel;
    } else {
      throw Exception(
          'Failed to load ... statuscode:${response.statusCode}\n${response.body}');
    }
  }
}
