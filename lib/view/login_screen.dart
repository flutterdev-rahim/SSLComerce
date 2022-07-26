import 'package:ddba/view/sendOtp_screen.dart';
import 'package:flutter/material.dart';

import 'Otp_Screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Color(0xFFff9d00),
  elevation: 0,
  title:Center(child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),))
  // leading: IconButton(
  //   onPressed: () {
  //     //Drawer(child: MyDrawer());
  //   },
  //   icon: Icon(
  //     Icons.menu,
  //     color: Colors.white,
  //     size: 30,
  //   ),
  // ),
  // actions: [
  //   IconButton(
  //     onPressed: () {},
  //     icon: Icon(
  //       Icons.notifications,
  //       color: Colors.white,
  //       size: 30,
  //     ),
  //   ),
  // ],
),
body: SingleChildScrollView(
  child:   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 100),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("Member Id",style: TextStyle(color: Colors.orange,fontSize: 16),),
        TextField(
               decoration: InputDecoration(
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xFFff9d00))),
        //  labelText: 'User Name',
               hintText: 'Enter Your Member Id Number',
          //  controller: _emailController,

        ),),
        SizedBox(height: 30,),
        Text("Member Number",style: TextStyle(color: Colors.orange,fontSize: 16),),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Color(0xFFff9d00))),
            //  labelText: 'User Name',
            hintText: 'Enter Member Mobile Numbert',
            //  controller: _emailController,

          ),),
        SizedBox(height: 40,),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFff9d00),
              onPrimary: Color(0xffE37D4E),
              elevation: 5,
            ),
            onPressed: () async{
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>Otp_Screen()));
              // if (numberController.text.isNotEmpty && numberController.text.length>10) {
              //   int responseStatus =await getPost();
              //   print(responseStatus);
              //   if (responseStatus == 200) {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) =>
              //             SendOtp_screen(mobile: numberController.text.toString(), token: '',)
              //     )
              //     );
              //   }
              // }
            },
            child: Container(
              //margin: EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIGN UP / LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

      ],


    ),

  ),
),
    );
  }
}
