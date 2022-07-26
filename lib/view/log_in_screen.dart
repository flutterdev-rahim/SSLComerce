import 'package:ddba/view/sendOtp_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'app_style.dart';

class log_in_screen extends StatefulWidget {
  const log_in_screen({Key? key}) : super(key: key);
  @override
  State<log_in_screen> createState() => _log_in_screenState();
}

class _log_in_screenState extends State<log_in_screen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController memberIdController = TextEditingController();

  final String postsUrl ="https://bppshops.com/api/sendOtp";
  Future<int> getPost() async {
    var res = await http.post(Uri.parse(postsUrl),
        body: {'mobile': numberController.text});
    return res.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to DTBA",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  label: Text("Member ID"),
                  //hintText: "En",
                  fillColor: Colors.white70),
              keyboardType: TextInputType.number,
              controller: memberIdController,

            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  //hintText: "Enter your phone number",
                  label: Text("Phone Number"),
                  fillColor: Colors.white70),
              keyboardType: TextInputType.number,
              controller: numberController,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,//Colors.purple,
                onPrimary: primaryColor,//Color(0xffE37D4E),
                elevation: 3,
                minimumSize: Size(100, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () async{
                if (numberController.text.isNotEmpty) {
                  int responseStatus =await getPost();
                  print(responseStatus);
                  if (responseStatus == 200) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SendOtp_screen(mobile: numberController.text.toString(), token: '',)
                    )
                    );
                  }
                }
              },
              child: Container(
                //margin: EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
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
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
