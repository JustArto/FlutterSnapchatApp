import 'package:flutter/material.dart';
import 'package:flutter_snapchat_app/widget/auth_button.dart';

import 'cuper_birthday_screen.dart';

void main(List<String> args) {
  runApp(SignUpScreen());
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _backArrowButton(),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(children: [
                _renderText(),
                _firstNameText(),
                _secondNameText(),
                _textButton(),
              ]),
            ),
          )),
          _signUpButton()
        ],
      ),
    ));
  }

  Widget _signUpButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
          child: AuthButton(
        isActive: _isActive() ,
        text: 'Sign Up & Accept',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyBirthDayScreen()));
        },
      )),
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

  Widget _renderText() {
    return const Text(
      "What's your name?",
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameText() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            
          });;
        },
        controller: _signFirsName,
        decoration: InputDecoration(
          labelText: 'USERNAME OR EMAIL',
          errorText: !_isValidFirstnameEmail ? 'Cant be null' : null,
          labelStyle: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }

  Widget _secondNameText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            
          });
        },
        controller: _signSecondName,
        decoration: InputDecoration(
          labelText: 'USERNAME OR EMAIL',
          errorText: !_isValidSecondnameEmail ? 'Cant be null' : null,
          labelStyle: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }

  Widget _textButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: () {},
      child: const Text('By tapping Sign Up & Accept..'),
    );
  }

  TextEditingController _signFirsName = TextEditingController();
  TextEditingController _signSecondName = TextEditingController();

  bool _isActive() {
    return _isValidFirstnameEmail && _isValidSecondnameEmail;
  }

  bool get _isValidFirstnameEmail {
    return _signFirsName.text.isNotEmpty;
  }
  bool get _isValidSecondnameEmail {
    return _signSecondName.text.isNotEmpty;
  }



  //bool _isButtonDisabled = false;

  // bool _validFirst = false;
  // bool _validSecond = false;

  
  // void _validChecker() {
  //   setState(() {
  //     //if(emailText.text.length<1) return
  //     signFirsName.text.length < 1 && signFirsName.text.isEmpty
  //         ? _validFirst = true
  //         : _validFirst = false;
  //     //emailText.text.isEmpty ? _validEmail = true : _validEmail = false;
  //     signSecondName.text.length < 1 || signSecondName.text.isEmpty
  //         ? _validSecond = true
  //         : _validSecond = false;
  //     // passText.text.isEmpty ? _validPass = true : _validPass = false;
  //     !_validFirst && !_validSecond
  //         ? _isButtonDisabled = true
  //         : _isButtonDisabled = false;
  //   });
  // }

  // bool _boolValid(){
  // bool _isButtonDisabled = false;

  // bool _validFirst=false;
  // bool _validSecond=false;

  //   if (signFirsName.text.length<1 && signFirsName.text.isEmpty)_validFirst=true;
  //     _validSecond=false;
  //   if(signSecondName.text.length<1 || signSecondName.text.isEmpty)_validSecond = true;
  //     _validSecond = false;
  //   return !_validFirst && !_validSecond ? _isButtonDisabled=true : _isButtonDisabled=false;
  // }
}
