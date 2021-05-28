import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:groupalike/UI/Homepage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  User user;

   @override
  void initState() {
    _auth.userChanges().listen((event) => setState(() => user = event));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
                  child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width - 100,
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                ),
                TextField(
                  controller: emailtextEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter your Email ID",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordtextEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 100,
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: StadiumBorder(),
                    onPressed: () async {
                      await _signInWithEmailAndPassword();
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 100,
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign in with Google",
                    shape: StadiumBorder(),
                    onPressed: () {
                      //TODO
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      "Create a new account",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: emailtextEditingController.text,
        password: passwordtextEditingController.text,
      )).user;
      print(user.uid);
      Navigator.pop(context);
      Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen(uid: user.uid)));
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger(
        child: SnackBar(
          content: Text('Failed to sign in with Email & Password'),
        ),
      );
    }
  }
}


