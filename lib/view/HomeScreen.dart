import 'package:ddba/service/db_service.dart';
import 'package:ddba/view/widget.dart';
import 'package:flutter/material.dart';

import '../model/PaymentModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Payments Details"),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: FutureBuilder(
            future: DBService().getPaymentDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data> payment = snapshot.data as List<Data>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRichText(title: "id ",data: payment[0].id.toString(),),
                    CustomRichText(title: "receiptNumber ",data: payment[0].receiptNumber.toString(),),
                    CustomRichText(title: "receiptDate ",data: payment[0].receiptDate.toString(),),
                    CustomRichText(title: "startDate ",data: payment[0].startDate.toString(),),
                    CustomRichText(title: "finishDate ",data: payment[0].finishDate.toString(),),
                    CustomRichText(title: "monthPeriod ",data: payment[0].monthPeriod.toString(),),
                    CustomRichText(title: "totalAmount ",data: payment[0].totalAmount.toString(),),
                    CustomRichText(title: "status ",data: payment[0].status.toString(),),
                    CustomRichText(title: "memberId ",data: payment[0].memberId.toString(),),
                    CustomRichText(title: "membershipNumber ",data: payment[0].membershipNumber.toString(),),
                    CustomRichText(title: "memberName ",data: payment[0].memberName.toString(),),
                    CustomRichText(title: "memberMobileNumber ",data: payment[0].memberMobileNumber.toString(),),


                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple
                      ),
                      onPressed: ()async{
                        await DBService().getReceipt(context);
                      },
                      child: Text("PAID",style: TextStyle(color: Colors.white),),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
