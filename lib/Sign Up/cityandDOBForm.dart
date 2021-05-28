import 'package:flutter/material.dart';
import 'package:groupalike/Firestore/functions.dart';
import 'package:groupalike/UI/Homepage.dart';

class CityandDOBForm extends StatefulWidget {
  @override
  _CityandDOBFormState createState() => _CityandDOBFormState();

  String uid;
  CityandDOBForm({this.uid});
}

class _CityandDOBFormState extends State<CityandDOBForm> {
  TextEditingController dateCtl = TextEditingController();
  TextEditingController citycontroller = TextEditingController();

  

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
                  'Which City you live in?',
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
                  controller: citycontroller,
                  decoration: InputDecoration(hintText: 'Type Here'),
                ),
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Date of Birth',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextFormField(
                    controller: dateCtl,
                    decoration: InputDecoration(
                      hintText: "yyyy-mm-dd",
                    ),
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));

                      // dateCtl.text = date.toIso8601String();
                      dateCtl.text = date.toIso8601String().substring(0,10);
                    },
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
      await DatabaseMethods().updateInfo(widget.uid, dateCtl.text.toString(), citycontroller.text.toString());
      Navigator.pop(context);
      Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen(uid: widget.uid,)));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
