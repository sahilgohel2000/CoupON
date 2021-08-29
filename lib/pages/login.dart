import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:login/pages/homepage.dart';
import 'package:login/pages/register1.dart';

import '../progressHUD.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  final scaffoldkey = GlobalKey<ScaffoldState>();

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool visible = false ;
  bool hidePassword = true;
  bool isApiCallProcess = false;

  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async{

    // Showing CircularProgressIndicator.
    setState(() {
      isApiCallProcess = true ;
    });

    // Getting value from Controller
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER API URL
    // https://couponkml.000webhostapp.com/
    var url = 'https://couponkml.000webhostapp.com/login.php';

    // Store all data with Param Name.
    // var data = {'shopname': shopname,'fname': fname,'lname': lname,'phone':phone,'complex': complex, 'street' : street,'area': area,'city': city,'email': email,'password': password};
    var data = {'email': email, 'password': password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if(response.statusCode == 200){
      setState(() {
        isApiCallProcess = false;

        // final snackBar = SnackBar(
        //   content: Text(message),
        // );
        // scaffoldkey.currentState.showSnackBar(snackBar);
      });
      // showInSnackBar(message);
    }
    if(response.statusCode == 500){
      setState(() {
        isApiCallProcess = false;
        // final snackBar = SnackBar(
        //   content: Text(message),
        // );
        // scaffoldkey.currentState.showSnackBar(snackBar);
      });
    }
    // else{
    //   setState(() {
    //     isApiCallProcess = true ;
    //     final snackBar = SnackBar(
    //       content: Text("Invalid credentials"),
    //     );
    //     scaffoldkey.currentState.showSnackBar(snackBar);
    //   });
    //
    //
    //
    // }
    //   final snackBar = SnackBar(
    //     content: Text("Invalid credentials"),
    //   );
    //   scaffoldkey.currentState.showSnackBar(snackBar);
    // }


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
                _navigateToHomePage(context);
              },
            ),
          ],
        );
      },
    );

  }

  void showInSnackBar(String value) {
    // final snackBar = SnackBar(
    //   content: Text(value),
    // );
    // scaffoldkey.currentState.showSnackBar(snackBar);


  }


  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget uiSetup(BuildContext context) {

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
                    margin: EdgeInsets.symmetric(vertical: 180, horizontal: 20),
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
                            "Login",
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

                              hintText: "  Email Address",
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
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).accentColor,
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
                              hintText: "  Password",
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
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).accentColor,
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

                          //login Button
                          SizedBox(
                            height: 25,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 80,
                            ),
                            onPressed: userLogin,

                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Theme.of(context).accentColor,
                            shape: StadiumBorder(),
                          ),

                          //Signup Link
                          SizedBox(
                            height: 5,
                          ),
                          FlatButton(
                            textColor: Colors.blue,
                            child: Text(
                              'Sign up',
                              style: TextStyle(fontSize: 12,
                                  color: Colors.blue),
                            ),
                            onPressed: (){
                              _navigateToNextScreen(context);
                            },

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
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => Register1()));
}
void _navigateToHomePage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => HomePage()));
}