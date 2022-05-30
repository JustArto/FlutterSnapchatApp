import 'package:flutter/material.dart';
import 'package:flutter_snapchat_app/true_screen/login_screen.dart';
import 'package:flutter_snapchat_app/true_screen/signup_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,backgroundColor: Colors.yellow, body: _authentication());
  }

  Widget _authentication() {
    return 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _renderLogo(),
          Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [_loginButton(), _signUpButton()],
              ))
        ],
      );
    
  }

  Widget _renderLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Container(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/snap-logo.png'),
        height: 100,
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      height: 50,
      minWidth: double.infinity,
      color: Colors.red,
      child: const Text(
        'LOG IN',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _signUpButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      height: 50,
      minWidth: double.infinity,
      color: Colors.blue,
      child: const Text(
        'SIGN UP',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
