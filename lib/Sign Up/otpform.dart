import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:groupalike/Sign%20Up/cityandDOBForm.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class OTPandPasswordForm extends StatefulWidget {
  @override
  _OTPandPasswordFormState createState() => _OTPandPasswordFormState();

  String email;
  OTPandPasswordForm({this.email});
}

class _OTPandPasswordFormState extends State<OTPandPasswordForm> {
  final TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _success;
  String _userEmail = '';
  User user;

  @override
  void initState() {
    sendOtp();
    super.initState();
  }

  void sendOtp()async{
    ///Accessing the EmailAuth class from the package
       EmailAuth.sessionName = "Sample";
    ///a boolean value will be returned if the OTP is sent successfully
    var data = await EmailAuth.sendOtp(receiverMail: widget.email);
    if(!data){
        ///have your error handling logic here, like a snackbar or popup widget
    }
  }
  ///create a bool method to validate if the OTP is true
  bool verify(){
    return(EmailAuth.validate(
        receiverMail: widget.email, //to make sure the email ID is not changed
        userOTP: otpController.value.text)); //pass in the OTP typed in
    ///This will return you a bool, and you can proceed further after that, add a fail case and a success case (result will be true/false)
  }

  Future<void> _register() async {
    final  User user = (await _auth.createUserWithEmailAndPassword(
      email: widget.email,
      password: passwordController.text,
    )).user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Verify OTP',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(hintText: 'Type Here'),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '*An OTP has been sent to ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '${widget.email}', //TODO
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Re-Enter Password'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await _register().whenComplete(() {
          if(_success==null || _success==false || verify()==false) {
            print('unable to register');
            print("Success $_success");
            print(verify().toString());
          }
          else {
            print("Great Success!!");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CityandDOBForm()));
          }
          });
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
