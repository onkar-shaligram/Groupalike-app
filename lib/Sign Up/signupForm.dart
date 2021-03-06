import 'package:flutter/material.dart';
import 'package:groupalike/Sign%20Up/otpform.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  
  String _chosenValue;
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();

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
                  'Your Name',
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
                  controller: fnameController,
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: lnameController,
                  decoration: InputDecoration(hintText: 'Last Name'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),

                    items: <String>[
                      'Male',
                      'Female',
                      'Other',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Select Gender\t\t\t\t\t\t\t\t\t\t\t\t",
                      style: TextStyle(
                        //: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Email',
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
                  controller: emailtextEditingController,
                  decoration: InputDecoration(hintText: 'Enter your Email ID'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: GestureDetector(
                  onTap: () {
                    //TODO
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Or Sign up using  ",
                          style: TextStyle(color: Colors.black87)),
                      TextSpan(
                          text: "Phone Number",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => OTPandPasswordForm(email: emailtextEditingController.text.toString(), fname: fnameController.text.toString(), lname: lnameController.text.toString())));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
