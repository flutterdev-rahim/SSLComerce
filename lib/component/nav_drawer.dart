import 'package:flutter/material.dart';
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenu(context),
          ],
        ),
      ),
    );
  }
}
Widget buildHeader(BuildContext context)=> Container();
Widget buildMenu(BuildContext context)=> Padding(
  padding: const EdgeInsets.only(top: 40),
  child:   Column(
    children: [
      ListTile(
        leading: Icon(Icons.person,color: Colors.orange,),
        title: Text("Prifile"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.money,color: Colors.orange,),
        title: Text("Order Status"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.home_outlined,color: Colors.orange,),
        title: Text("Payment Status"),
        onTap: (){},
      )
      ,
      ListTile(
        leading: Icon(Icons.notifications,color: Colors.orange,),
        title: Text("Notification"),
        onTap: (){},
      )
    ],
  ),
);
