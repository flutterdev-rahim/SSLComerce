import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class SendOtp_screen extends StatefulWidget {
  SendOtp_screen({Key? key, required this.mobile, required this.token})
      : super(key: key);

  String mobile;
  String token;

  @override
  _SendOtp_screenState createState() => _SendOtp_screenState();
}

class _SendOtp_screenState extends State<SendOtp_screen> {
  final String postUrl="https://bppshops.com/api/loginWithOtp";
  TextEditingController numberController =TextEditingController();

  // void saveOtpUserToken({String? token}) async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   _prefs.setString('token', token!);
  //   print(_prefs.getString("token"));
  // }




  Future<Response> getPost() async {
    var res = await post(Uri.parse(postUrl), body: {
      'mobile': widget.mobile.toString(),
      'otp': numberController.text.toString(),

    });


    if(res.statusCode==201){
      return res;
    }
    else{
      throw "Error :${res.statusCode}";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff9d00),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back,),

        ),
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //
            //   },
            //   child: Text("Get Token"),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.white,
                  elevation: 3,
                  minimumSize: Size(100, 50),
                ),
                onPressed: () {

                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        size: 20, //Icon Size
                        color:Color(0xFFff9d00), //Color Of Icon
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Login with Email',
                        style: TextStyle(color: Colors.black,fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      indent: 20.0,
                      endIndent: 10.0,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "or",
                    style: TextStyle(color: Colors.black),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 20.0,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "We've sent a 4-digit one time PIN in your phone",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${widget.mobile}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 40, right: 15),
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: numberController,
                      minLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Please enter 4-digit one time pin',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:Color(0xFFff9d00),
                  onPrimary: Color(0xffE37D4E),
                  elevation: 3,
                  minimumSize: Size(100, 40),
                ),
                onPressed: () async {
                  Response response= await getPost();

                  if (response.statusCode == 201) {
                    final json=jsonDecode(response.body);
                    print(json["token"]);
                    // saveOtpUserToken(
                    //   token: json["token"],
                    // );

                    print("Okey..........");

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen()
                             // (mobile: numberController.text.toString(), token: '',)
                    )
                   );
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => BottomNavBar(
                    //             currentTab: 0, currentScreen: HomeScreen(nameFromFacebook: widget.mobile,routeKey: 3,))),
                    //         (route) => false);
                  }
                },
                child: Center(
                  child: Container(
                  //  margin: EdgeInsets.symmetric(horizontal: 130),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This site is protected by reCAPTCHA and the Google",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Privacy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Policy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "and",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Terms of Service",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "apply",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
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

