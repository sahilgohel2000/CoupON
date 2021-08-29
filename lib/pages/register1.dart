import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login/pages/register2.dart';
import 'globals.dart' as global;
import 'globals.dart';

class Register1 extends StatefulWidget{
  @override
  _RegisterState1 createState() => _RegisterState1();
}

class _RegisterState1 extends State<Register1>{
  bool visible = false ;

  // Getting value from TextField widget.
  // final shopnameController = TextEditingController();
  // final fnameController = TextEditingController();
  // final lnameController = TextEditingController();
  // final phoneController = TextEditingController();
  // final complexController = TextEditingController();
  // final streetController = TextEditingController();
  // final areaController = TextEditingController();
  // final cityController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();


  Future userRegistration() async{
  //   // Showing CircularProgressIndicator.
  //   setState(() {
  //     visible = true ;
  //   });
  //
  //   // Getting value from Controller
    global.shopname = shopnameController.text;
    global.fname = fnameController.text;
    global.lname = fnameController.text;
    global.phone = phoneController.text;

  //   // String complex = complexController.text;
  //   // String street = streetController.text;
  //   // String area = areaController.text;
  //   // String city = cityController.text;
  //   // String email = emailController.text;
  //   // String password = passwordController.text;
  //
  //   // SERVER API URL
  //   // https://couponkml.000webhostapp.com/
  //   // var url = 'https://couponkml.000webhostapp.com/register.php';
  //
  //   // Store all data with Param Name.
  //   // var data = {'shopname': shopname,'fname': fname,'lname': lname,'phone':phone};
  //
  //   // Starting Web API Call.
  //   var response = await http.post(url, body: json.encode(data));
  //
  //   // Getting Server response into variable.
  //   var message = jsonDecode(response.body);
  //
  //   // If Web call Success than Hide the CircularProgressIndicator.
  //   if(response.statusCode == 200){
  //     setState(() {
  //       visible = false;
  //     });
  //   }
  //
  //   // Showing Alert Dialog with Response JSON Message.
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: new Text(message),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: new Text("OK"),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 140, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.blueAccent,
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ]),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          //Login Text
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Signup",
                            style: Theme.of(context).textTheme.headline2,
                          ),

                          //sopname
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: shopnameController,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            // obscureText: hidePassword,
                            decoration: new InputDecoration(

                              hintText: "  Shop Name",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ),

                          //fname
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: fnameController,
                            decoration: new InputDecoration(
                              // hintText: "Last Name",
                              hintText: "  First Name",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ),

                          //lname
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: lnameController,
                            decoration: new InputDecoration(
                              hintText: "  Last Name",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ),

                          //phone
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            decoration: new InputDecoration(
                              hintText: "  Phone",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ),

                          //next Button
                          SizedBox(
                            height: 25,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 80,
                            ),
                            onPressed: (){
                              userRegistration();
                              _navigateToNextScreen(context);
                            },
                            // onPressed: userRegistration,

                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Theme.of(context).accentColor,
                            shape: StadiumBorder(),
                          ),

                          Visibility(
                              visible: visible,
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: CircularProgressIndicator()
                              )
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register2() ));
}