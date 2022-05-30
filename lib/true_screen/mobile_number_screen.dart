import 'package:flutter/material.dart';
import 'package:flutter_snapchat_app/widget/auth_button.dart';

void main(List<String> args) {
  runApp(MobileNumber());
}

class MobileNumber extends StatefulWidget {
  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  //bool _isButtonDisabled = false;
  TextEditingController _mobileNumberText = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _backArrowButton(),
            Padding(
            padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  _renderText(),
                  _textButton(),
                  _mobNumberTextField(),
                ],),
          ),
            _continueButton()
          ],
        ),
      ),
    ));
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

  Widget _textButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: () {},
      child: const Text('Sign up with email instead!'),
    );
  }

  Widget _continueButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: AuthButton(
        isActive: _isValidNumber,
        text: 'Continue',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MobileNumber()));
        },
      )),
    );
  }

  Widget _mobNumberTextField(){
    return TextFormField(
      controller: _mobileNumberText,
    onChanged: (value) => setState(() {}),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(errorText:  !_isValidNumber ? 'Cant be lower than 8 numbers' : null,
                      labelText: 'Mobile Number', labelStyle: const TextStyle(fontSize: 13),prefixText: '+374',)
                );
  }

Widget _renderText() {
  return const Text(
    "What's your mobile number?",
    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  );
}


  bool get _isValidNumber {
    return _mobileNumberText.text.length > 7;
  }

}


