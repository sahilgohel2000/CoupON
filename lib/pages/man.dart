import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:login/pages/homepage.dart';


void main() {
  runApp(MaterialApp(
      home:MyApp()
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner:false,
      home:new homescreen(),
    );
  }
}

class homescreen extends StatefulWidget {
  @override
  _homescreen createState() => _homescreen();
}

class _homescreen extends State<homescreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      //created app bar
      appBar: AppBar(
        elevation: 0.1,
        title:Container(
          alignment: Alignment.center,
          child: Text(
            'CoupOn',
            style:TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
        ),

        actions: <Widget>[
          new IconButton(icon: Icon(Icons.notifications,color: Colors.yellow,), onPressed: (){},iconSize: 30.0,)
        ],
        backgroundColor: Colors.indigo[100],
      ),

      //side drawer
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //added account details
            new UserAccountsDrawerHeader
              (
              accountName: Text('Shop Name'),
              accountEmail: Text('Shopkeeper Name'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar
                  (
                  child: Image.asset('images/processimg/2062002861579680337-128.png'),
                ),
              ),
              decoration:new BoxDecoration(color: Colors.indigo[100]),
            ),

            //list
            InkWell(
              onTap: (){},
              child: ListTile
                (
                title: Text('My Coupons',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                leading: Image.asset('images/processimg/create.png',width: 30.0,height: 30.0,),
              ),
            ),
            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile
                (
                title: Text('My Customers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                leading: Image.asset('images/processimg/group.png',width: 30.0,height: 30.0),
              ),
            ),
            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile
                (
                title: Text('About Us',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                leading: Image.asset('images/processimg/information.png',width: 30.0,height: 30.0),
              ),
            ),

          ],
        ),
      ),

      body: Column(
        children: <Widget>[

          Container(
            child: Stack(
              children: <Widget>[

                Container(
                  padding:EdgeInsets.fromLTRB(250,590,0.0,0.0),
                  child: InkWell
                    (
                    onTap: (){},
                    child: Container(
                      child:ListTile
                        (
                        title: Image.asset('images/processimg/logout.png',width: 50.0,height: 50.0,),
                        subtitle:Container(alignment: Alignment.topCenter, child: Text('Logout',style: TextStyle(fontWeight: FontWeight.bold,),),),
                      ),
                    ),
                  ),
                ),

                //link or call constructor of component.dart
                HomePage(),
              ],
            ),
          ),

        ],
      ),
      backgroundColor: Colors.indigo[50],
    );
  }
}
