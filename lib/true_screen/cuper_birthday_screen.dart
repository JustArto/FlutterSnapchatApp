import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snapchat_app/true_screen/email_screen.dart';
import 'package:flutter_snapchat_app/widget/auth_button.dart';
import 'package:intl/intl.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBirthDayScreen(),
    );
  }
}

class MyBirthDayScreen extends StatefulWidget {
  @override
  _MyBirthDayScreenState createState() => _MyBirthDayScreenState();
}

class _MyBirthDayScreenState extends State<MyBirthDayScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Column(children: [
        _backArrowButton(),
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
            _renderText(),
            _birthdayTextField(),
          ],
        ))),
        _continueButton(),
        _cupertinoDataPicker()
      ]),
    );
  }

  Widget _renderText() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "When's your birthday?",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _continueButton() {
    return Container(
        alignment: Alignment.bottomCenter,
        child: AuthButton(
            isActive: _isAdult(),
            text: 'Continue',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmailScreen()));
            }));
  }

  Widget _cupertinoDataPicker() {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
          initialDateTime: _selectedData,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (value) {
            if (value != null) {
              setState(() {
                //print(value);
                var formattedDate = DateFormat('dd-MM-yyyy').format(value);
                dateinput.text = formattedDate;
                _selectedData = value;
              });
            }
          }),
    );
  }

  Widget _backArrowButton() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(top: 20),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _birthdayTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 200, left: 50, right: 50),
      child: TextFormField(
        controller: dateinput,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: 'Birthday',
          labelStyle: TextStyle(fontSize: 13),
        ),
      ),
    );
  }


    
  TextEditingController dateinput = TextEditingController();
  DateTime _selectedData = DateTime.now();

  bool _isAdult() {
    String datePattern = "dd-MM-yyyy";

    DateTime birthDate = _selectedData;
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 16 ? true : false;
  }

  // bool _isActive (){
  //   //print(DateTime.now().year.toInt()-_selectedData.year.toInt());
  //   if (DateTime.now().year - _selectedData.year >16) return true;
  //   return false;
  // }

}
