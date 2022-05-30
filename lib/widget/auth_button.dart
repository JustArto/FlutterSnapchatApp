import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  //final GestureDetector onPressed;
  
  AuthButton({
    required this.text,
    required this.onPressed,
    required this.isActive,
    Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(//padding: EdgeInsets.all(150),
      child: ElevatedButton( //onPressed: !isActive? onPressed:null,child: null,
        style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
      //side: BorderSide(color: Colors.blue)
    )
  )
),
        onPressed: isActive? onPressed:null,
        child: Container(
          height: 50,
          width: 170,
          //color: Colors.blue,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),
      ),
    );
  }
}