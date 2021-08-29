import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:login/pages/createcoupon.dart';
import 'package:login/pages/scan.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  String QRCodeResult = "";

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.QRCodeResult = barcode);
      // print(QRCodeResult);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(QRCodeResult),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ],
          );
        },
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.QRCodeResult = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.QRCodeResult = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.QRCodeResult = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.QRCodeResult = 'Unknown error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'coupON',
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_alert),
                  tooltip: 'Notification',
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('This is a snackbar')));
                  },
                ),
              ],
              backgroundColor: Theme.of(context).accentColor,
            ),
            drawer: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.

                padding: EdgeInsets.zero,

                children: <Widget>[
                  Container(
                    child: UserAccountsDrawerHeader(
                      accountName: Text('Shop Name'),
                      accountEmail: Text('Shopkeeper Name'),
                      currentAccountPicture: GestureDetector(
                        child: new CircleAvatar(
                          backgroundColor:
                              Theme.of(context).platform == TargetPlatform.iOS
                                  ? Colors.blue
                                  : Colors.white,
                          // child: Image.asset('images/drawer/profile.png'),
                          child: Text(
                            "A",
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                      ),
                      decoration: new BoxDecoration(
                          color: Theme.of(context).accentColor),
                    ),
                  ),

                  // DrawerHeader(
                  //
                  //   child: Text('Drawer Header'),
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  ListTile(
                    // leading: Image.asset('images/drawer/mycoupon.png',width: 30.0,height: 30.0),
                    leading: Image.asset('images/drawer/mycoupon.png',
                        width: 33.0, height: 50.0),
                    title: Text(
                      "My Coupons",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),

                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Image.asset('images/drawer/mycustomer.png',
                        width: 30.0, height: 30.0),
                    title: Text(
                      'My Customers',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Image.asset('images/drawer/aboutus.png',
                        width: 30.0, height: 30.0),
                    title: Text(
                      'About us',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            body: Center(
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  children: <Widget>[
                    //constructor of second class
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 40, 10.0, 0.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>CreateCoupon()),);
                        },
                        child: Container(
                          width: 100.0,
                          child: ListTile(
                            title: Image.asset(
                              'images/homepage/create.png',
                              width: 80.0,
                              height: 70.0,
                            ),
                            subtitle: Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10.0, 0.0),
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Create Coupon',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 10.0, 0.0),
                      child: InkWell(
                        onTap: ()  {
                          scan();
                        },
                        child: Container(
                          width: 100.0,
                          child: ListTile(
                            title: Image.asset(
                              'images/homepage/scan.png',
                              width: 80.0,
                              height: 70.0,
                            ),

                            subtitle: Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10.0, 0.0),
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Scan Coupon',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10.0, 0.0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, new MaterialPageRoute(builder: (context)=>three()),);
                          //Navigator.push(context, new MaterialPageRoute(builder: (context)=>two()),);
                        },
                        child: Container(
                          width: 100.0,
                          child: ListTile(
                            title: Image.asset(
                              'images/homepage/send.png',
                              width: 80.0,
                              height: 80.0,
                            ),
                            subtitle: Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10.0, 0.0),
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Send Coupon',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 10.0, 0.0),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context, new MaterialPageRoute(builder: (context)=>fourth()),);
                          //Navigator.push(context, new MaterialPageRoute(builder: (context)=>two()),);
                        },
                        child: Container(
                          width: 100.0,
                          child: ListTile(
                            title: Image.asset(
                              'images/homepage/history.png',
                              width: 80.0,
                              height: 70.0,
                            ),
                            subtitle: Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10.0, 0.0),
                              alignment: Alignment.topCenter,
                              child: Text(
                                'History',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children:[
              //
              //     Text('Set App Bar Background Color', style: TextStyle(fontSize: 24),)
              //
              //   ],
              // )
            )));
  }

}
