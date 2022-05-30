import 'package:flutter/material.dart';
import 'package:flutter_snapchat_app/true_screen/mobile_number_screen.dart';
import 'package:flutter_snapchat_app/widget/auth_button.dart';

import '../myJson/loading_json.dart';

main(List<String> args) {
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController passText = TextEditingController();
  TextEditingController emailText = TextEditingController();

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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(children: [
                    _renderText(),
                    _usernameOrEmailText(),
                    _passwordText(),
                    _textButton()
                  ]),
                ),
              ],
            ),
          )),
          _logInButton()
        ],
      ),
    ));
  }

  Widget _renderText() {
    return const Text(
      'Log In',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  Widget _logInButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
          child: AuthButton(
        isActive: isActive(),
        text: 'Log In',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MobileNumber()));
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

  Widget _usernameOrEmailText() {
    return TextFormField(
      onChanged: (value) {
        setState(() {});
        ;
      },
      controller: emailText,
      decoration: InputDecoration(
        labelText: 'USERNAME OR EMAIL',
        errorText: !_isValidUsernameEmail ? 'Cant be null' : null,
        labelStyle: TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _passwordText() {
    return TextFormField(
      onChanged: (value) {
        setState(() {});
        ;
      },
      controller: passText,
      obscureText: _isHide,
      decoration: InputDecoration(
          labelText: 'PASSWORD',
          errorText:
              !_isValidPassword ? 'Cant be lower than 8 characters' : null,
          labelStyle: const TextStyle(fontSize: 13),
          suffixIcon: IconButton(
              icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isHide = !_isHide;
                });
              })),
    );
  }

  Widget _textButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: () {},
      child: const Text('Forgot your password?'),
    );
  }

  bool _isHide = true;

  bool isActive() {
    return _isValidUsernameEmail && _isValidPassword;
  }

  bool get _isValidUsernameEmail {
    return emailText.text.isNotEmpty;
  }

  bool get _isValidPassword {
    return passText.text.length > 7;
  }

  @override
  void initState() {
    setState(() {
      try {
          print( JsonLoad().getCountry.toString());

      } catch (e) {
        print(e.toString());
      }

    });
    super.initState();
  }

  // void check() {
  //   setState(() {
  //     if(emailText.text.length<1) return
  //     emailText.text.isEmpty ? _validEmail = true : _validEmail = false;
  //     //emailText.text.isEmpty ? _validEmail = true : _validEmail = false;
  //     passText.text.length < 8 || passText.text.isEmpty
  //         ? _validPass = true
  //         : _validPass = false;
  //     // passText.text.isEmpty ? _validPass = true : _validPass = false;
  //     !_validEmail && !_validPass;
  //   });
  // }
}
