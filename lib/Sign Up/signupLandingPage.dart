import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:groupalike/Sign%20Up/signupForm.dart';

class SignUpLandingPage extends StatefulWidget {
  @override
  _SignUpLandingPageState createState() => _SignUpLandingPageState();
}

class _SignUpLandingPageState extends State<SignUpLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.network('https://picsum.photos/250?image=9'),
              SizedBox(
                height: 30,
              ),
              Text(
                "Start Your Journey",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.arrow_downward_rounded,
                size: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 100,
                child: SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  shape: StadiumBorder(),
                  onPressed: () {
                    //TODO
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Or",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 150,
              ),
              Divider(color: Colors.black),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: FlatButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignupForm()));
                  },
                  icon: Icon(Icons.arrow_upward),
                  label: Text("Create an Account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
