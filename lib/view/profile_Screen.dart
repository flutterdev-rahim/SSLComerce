import 'dart:convert';
import 'package:ddba/view/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);
  @override
  _MyProfileState createState() => _MyProfileState();
}
class _MyProfileState extends State<MyProfile>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>HomeScreen()));

          }),
        ),



        title: Text("Profile",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          Icon(Icons.edit),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Color(0xFFff9d00),
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    child:
                   CircleAvatar(
                      radius: MediaQuery
                          .of(context)
                          .size
                          .height * .06,
                      //maxRadius: 30,
                      backgroundColor: const Color(0xffe4e8e9),
                      backgroundImage: NetworkImage("https://demofree.sirv.com/nope-not-here.jpg"), //imageUrl)
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //CircularProgressIndicator(),
                TextFormField(
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .4),
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      floatingLabelBehavior: FloatingLabelBehavior
                          .always,
                      labelText: "Name",
                      labelStyle: TextStyle(fontSize: 18, color: Colors
                          .black87, fontWeight: FontWeight.normal),
                      hintText: "",
                      hintStyle: TextStyle(fontSize: 14, color: Colors
                          .black54)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      floatingLabelBehavior: FloatingLabelBehavior
                          .always,
                      labelText: "Email Address",
                      labelStyle: TextStyle(fontSize: 20, color: Colors
                          .black87),
                      hintText: "",
                      hintStyle: TextStyle(fontSize: 14, color: Colors
                          .black54),
                      suffix: SizedBox(
                        height: 30,
                        width: 80,
                        // child: ElevatedButton(
                        //     style: ButtonStyle(
                        //         backgroundColor:
                        //         MaterialStateProperty.all(
                        //             Colors.orange)),
                        //     onPressed: () {},
                        //     child: Text("Verify")),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      floatingLabelBehavior: FloatingLabelBehavior
                          .always,
                      labelText: "Mobile",
                      labelStyle: TextStyle(fontSize: 20, color: Colors
                          .black87),
                      //hintText: "01723063565",
                      hintStyle: TextStyle(fontSize: 14, color: Colors
                          .black54)),
                ),
                SizedBox(
                  height: 80,
                ),


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFff9d00),
                    onPrimary: Color(0xffE37D4E),
                    elevation: 5,
                  ),
                  onPressed: () async{
                   // Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>Otp_Screen()));

                  },
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
