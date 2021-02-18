import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localize_me/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
          ),
        ],
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'Usually reply with ',
            style: TextStyle(color: Colors.black, fontSize: 16.0),
            children: <TextSpan>[
              TextSpan(
                text: '\"Nae bad yoursel?\"',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                  // decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Terms of Service"');
                }),
            ],
          ),
        ),
      ),
    );
  }
}
