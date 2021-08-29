import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login/pages/login.dart';
import 'globals.dart' as global;
import 'globals.dart';

class Register3 extends StatefulWidget{
  @override
  _RegisterState3 createState() => _RegisterState3();
}


class _RegisterState3 extends State<Register3>{
  bool visible = false ;
  bool hidePassword = true;

  // Getting value from TextField widget.
  //   String shopname = shopnameController.text;
  //   String fname = fnameController.text;
  //   String lname = fnameController.text;
  //   String phone = phoneController.text;
  // final cityController = TextEditingController();
  // final stateController = TextEditingController();
  // final complexController = TextEditingController();
  // final streetController = TextEditingController();
  // final areaController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // final cnfmpasswordController = TextEditingController();


  Future userRegistration() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

  // Getting value from Controller
  // String shopname = shopnameController.text;
  // String fname = fnameController.text;
  // String lname = fnameController.text;
  // String phone = phoneController.text;
  // String complex = complexController.text;
  // String street = streetController.text;
  // String area = areaController.text;
  // String city = cityController.text;
    global.email = emailController.text;
    global.password = passwordController.text;
    global.cnfmpassword = cnfmpasswordController.text;

  // SERVER API URL
  // https://couponkml.000webhostapp.com/
  var url = 'https://couponkml.000webhostapp.com/register.php';

  // Store all data with Param Name.
  // var data = {'shopname': shopname,'fname': fname,'lname': lname,'phone':phone};
    var data = {
      "shopname": global.shopname,
      "fname": global.fname,
      "lname": global.lname,
      "phone":global.phone,
      "shopno":global.shopno,
      "complex": global.complex,
      "area": global.area,
      "city": global.city,
      "state": global.state,
      "email": global.email,
      "password": global.password
    };
  // // Starting Web API Call.
  var response = await http.post(url, body: json.encode(data));

  // Getting Server response into variable.
  var message = jsonDecode(response.body);

  // If Web call Success than Hide the CircularProgressIndicator.
  if(response.statusCode == 200){
    setState(() {
      visible = false;
    });
  }

  // Showing Alert Dialog with Response JSON Message.
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(message),
        actions: <Widget>[
          FlatButton(
            child: new Text("OK"),
            onPressed: () {
              // Navigator.of(context).pop();
              _navigateToNextScreen(context);
            },
          ),
        ],
      );
    },
  );

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
                    margin: EdgeInsets.symmetric(vertical: 145, horizontal: 20),
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

                          //email
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: emailController,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            // obscureText: hidePassword,
                            decoration: new InputDecoration(

                              hintText: "  Email",
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

                          //password
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: hidePassword,

                            decoration: new InputDecoration(
                              // hintText: "Last Name",
                              hintText: "  Password ",
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color:
                                Theme.of(context).accentColor.withOpacity(0.4),
                                icon: Icon(
                                  hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                          ),

                          //cnfmpassword
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // new TextFormField(
                          //   keyboardType: TextInputType.text,
                          //   controller: cnfmpasswordController,
                          //   decoration: new InputDecoration(
                          //     hintText: "  Area",
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Theme.of(context)
                          //             .accentColor
                          //             .withOpacity(0.2),
                          //       ),
                          //     ),
                          //     focusedBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Theme.of(context).accentColor,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          //signup Button
                          SizedBox(
                            height: 25,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 80,
                            ),
                            onPressed:(){
                              userRegistration();
                            },

                            child: Text(
                              "Signup",
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
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login() ));
}