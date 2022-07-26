import 'package:ddba/service/db_service.dart';
import 'package:ddba/view/app_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/PaymentModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor, //Colors.purple,
          centerTitle: true,
          title: Text("Payments Receipt List"),
        ),
        drawer: Drawer(
          child: Scaffold(
            appBar: AppBar(
              leading: SizedBox(),
              backgroundColor: primaryColor,
              centerTitle: true,
              title: Text("drawer"),
            ),
            body: Container(
              color: secondaryColor,//Colors.brown,
              //child: ,
            ),
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: FutureBuilder(
            future: DBService().getPaymentDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data> payment = snapshot.data as List<Data>;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: SingleChildScrollView(
                    child: DataTable(
                        showBottomBorder: true,
                        dividerThickness: 1,
                        columnSpacing: 1,
                        columns: [
                          DataColumn(
                              label: Text(
                            'Receipt Number',
                            style: TextStyle(
                                //fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          )),
                          DataColumn(
                              label: Text(
                            'Receipt Date',
                            style: TextStyle(
                                //fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          )),
                          DataColumn(
                              label: Text(
                            'totalAmount',
                            style: TextStyle(
                                //fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          )),
                          DataColumn(
                              label: Text(
                            'status',
                            style: TextStyle(
                                //fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ))
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(
                              payment[0].id.toString(),
                            )),
                            DataCell(Text(
                              payment[0].receiptDate.toString(), //'Zisan'
                            )),
                            DataCell(Text(
                              payment[0].totalAmount.toString(), //'16'
                            )),
                            DataCell(Text(
                              payment[0].status.toString(), //'16'
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(
                              payment[0].id.toString(),
                            )),
                            DataCell(Text(
                              payment[0].receiptDate.toString(), //'Zisan'
                            )),
                            DataCell(Text(
                              payment[0].totalAmount.toString(), //'16'
                            )),
                            DataCell(Text(
                              payment[0].status.toString(), //'16'
                            )),
                          ]),
                        ]),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: currentIndex == -1 ? primaryColor : secondaryColor,
          onPressed: () {
            setState(() {
              currentIndex = -1;
            });
          },
          child: const Icon(FontAwesomeIcons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...MainMenuModel.list.map(
                (MainMenuModel data) {
                  return data.isBlank
                      ? const SizedBox(
                          width: 10,
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = data.index;
                            });
                            // ignore: avoid_print
                            print(data.index.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //SizedBox(height: 10,),
                                Icon(
                                  data.icon,
                                  color: currentIndex == data.index
                                      ? primaryColor
                                      : secondaryColor,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  data.label!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: currentIndex == data.index
                                              ? primaryColor
                                              : secondaryColor),
                                )
                              ],
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ));
  }

  _getBody() {
    switch (currentIndex) {
      case 0:
        return Container();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return _buildHompageBody;
    }
  }

  Widget _buildHompageBody(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: FutureBuilder(
        future: DBService().getPaymentDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Data> payment = snapshot.data as List<Data>;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: SingleChildScrollView(
                child: DataTable(
                    showBottomBorder: true,
                    dividerThickness: 1,
                    columnSpacing: 1,
                    columns: [
                      DataColumn(
                          label: Text(
                        'Receipt Number',
                        style: TextStyle(
                            //fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      )),
                      DataColumn(
                          label: Text(
                        'Receipt Date',
                        style: TextStyle(
                            //fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      )),
                      DataColumn(
                          label: Text(
                        'totalAmount',
                        style: TextStyle(
                            //fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      )),
                      DataColumn(
                          label: Text(
                        'status',
                        style: TextStyle(
                            //fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ))
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(
                          payment[0].id.toString(),
                        )),
                        DataCell(Text(
                          payment[0].receiptDate.toString(), //'Zisan'
                        )),
                        DataCell(Text(
                          payment[0].totalAmount.toString(), //'16'
                        )),
                        DataCell(Text(
                          payment[0].status.toString(), //'16'
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text(
                          payment[0].id.toString(),
                        )),
                        DataCell(Text(
                          payment[0].receiptDate.toString(), //'Zisan'
                        )),
                        DataCell(Text(
                          payment[0].totalAmount.toString(), //'16'
                        )),
                        DataCell(Text(
                          payment[0].status.toString(), //'16'
                        )),
                      ]),
                    ]),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MainMenuModel {
  late final int index;
  late final IconData? icon;
  late final String? label;
  late final bool isBlank;
  MainMenuModel(
      {required this.index, this.label, this.icon, this.isBlank = false});

  static List<MainMenuModel> list = [
    MainMenuModel(
      index: 0,
      label: 'Menu',
      icon: FontAwesomeIcons.thLarge,
    ),
    MainMenuModel(
      index: 1,
      label: 'Offers',
      icon: FontAwesomeIcons.shoppingBag,
    ),
    MainMenuModel(
      index: -1,
      isBlank: true,
    ),
    MainMenuModel(
      index: 2,
      label: 'Profile',
      icon: FontAwesomeIcons.userAlt,
    ),
    MainMenuModel(
      index: 3,
      label: 'More',
      icon: FontAwesomeIcons.indent,
    ),
  ];
}
