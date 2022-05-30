import 'package:flutter/material.dart';
import 'package:flutter_snapchat_app/true_screen/mobile_number_screen.dart';
import '../widget/auth_button.dart';

main(List<String> args) {
  runApp(EmailScreen());
}

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          _backArrowButton(),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Form(
              child: Column(
                children: [
                  const Text(
                    "What's your email?",
                    style: TextStyle(fontSize: 25),
                  ),
                  _textButton(),
                  _emailTextField(),
                ],
              ),
            ),
          ),
          _logInButton()
        ])),
      ),
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

  Widget _logInButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: AuthButton(
        isActive: !_isValidEmail(),
        text: 'Continue',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MobileNumber()));
        },
      )),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      controller: _emailText,
      onChanged: (value) => setState(() {}),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          errorText: _emailText.text.isEmpty
              ? null
              : !_isValidEmail()
                  ? null
                  : 'Email cant be null',
          labelText: 'EMAIL',
          labelStyle: TextStyle(fontSize: 13)),
    );
  }

  Widget _textButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: () {},
      child: const Text('Sign up with phone instead'),
    );
  }

  final TextEditingController _emailText = TextEditingController();
   
  bool _isValidEmail() {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // ignore: omit_local_variable_types
    RegExp regExp = RegExp(pattern.toString());
    // ignore: avoid_bool_literals_in_conditional_expressions
    return !(regExp.hasMatch(_emailText.text.toString())) ? true : false;
  }

  // void check() {
  //   setState(() {
  //     emailText.text.isEmpty
  //         ? validEmail = false
  //         : isValidEmail()
  //             ? validEmail = true
  //             : validEmail = false;
  //   });
  // }
}
