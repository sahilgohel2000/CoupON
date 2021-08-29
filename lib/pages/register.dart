import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>{
  bool visible = false ;

  // Getting value from TextField widget.
  final shopnameController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final phoneController = TextEditingController();
  final complexController = TextEditingController();
  final streetController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  Future userRegistration() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String shopname = shopnameController.text;
    String fname = fnameController.text;
    String lname = fnameController.text;
    String phone = phoneController.text;
    String complex = complexController.text;
    String street = streetController.text;
    String area = areaController.text;
    String city = cityController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER API URL
    // https://couponkml.000webhostapp.com/
    var url = 'https://couponkml.000webhostapp.com/register.php';

    // Store all data with Param Name.
    var data = {'shopname': shopname,'fname': fname,'lname': lname,'phone':phone,'complex': complex, 'street' : street,'area': area,'city': city,'email': email,'password': password};
    // var data = {'shopname': shopname, 'fname': fname, 'lname' : lname};

    // Starting Web API Call.
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
                Navigator.of(context).pop();
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
                    margin: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
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

                          // Container(
                          //     width: 280,
                          //     padding: EdgeInsets.all(10.0),
                          //     child: TextField(
                          //       controller: nameController,
                          //       autocorrect: true,
                          //       decoration: InputDecoration(hintText: 'Enter Your Name Here'),
                          //     )
                          // ),

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

                          // Container(
                          //     width: 280,
                          //     padding: EdgeInsets.all(10.0),
                          //     child: TextField(
                          //       controller: emailController,
                          //       autocorrect: true,
                          //       decoration: InputDecoration(hintText: 'Enter Your Email Here'),
                          //     )
                          // ),

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

                          //complex
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: complexController,
                            decoration: new InputDecoration(
                              // hintText: "Last Name",
                              hintText: "  Complex",
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

                          //street
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: streetController,
                            decoration: new InputDecoration(
                              // hintText: "Last Name",
                              hintText: "  Street",
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

                          //area
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: areaController,
                            decoration: new InputDecoration(
                              // hintText: "Phone no",
                              hintText: "  Area",
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

                          //city
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cityController,
                            decoration: new InputDecoration(
                              // hintText: "Phone no",
                              hintText: "  City",
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

                          //email
                          SizedBox(
                            height: 20,
                          ),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            controller: emailController,
                            decoration: new InputDecoration(
                              // hintText: "Phone no",
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
                            decoration: new InputDecoration(
                              // hintText: "Phone no",
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
                            ),
                          ),


                          //signup Button
                          SizedBox(
                            height: 25,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 80,
                            ),
                            onPressed: userRegistration,

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