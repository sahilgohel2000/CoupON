import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(Calender());

class Calender extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Add Date Picker in Flutter')
            ),
            body: Center(
                child: DatePicker()
            )
        )
    );
  }
}

class DatePicker extends StatefulWidget {

  DatePickerWidget createState() => DatePickerWidget();

}

class DatePickerWidget extends State {

  DateTime selectedDate = DateTime.now() ;

  var customFormat = DateFormat('dd-MM-yyyy');

  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text('${customFormat.format(selectedDate)}', style: TextStyle(fontSize: 22),),
            SizedBox(height: 20.0,),

            RaisedButton(
              onPressed: () => showPicker(context),
              child: Text('Click Here To Select Date'),
              textColor: Colors.white,
              color: Colors.blue,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),

          ],
        ),
      ),
    );
  }
}