import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groupalike/Firestore/functions.dart';
import 'package:groupalike/UI/landingpage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  String uid;
  HomeScreen({this.uid});
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    
  getData() async{
    return FirebaseFirestore.instance.collection("users").doc(widget.uid).get().
    then((value){
      print(value.data()['uid']);
      return value.data()['uid'];
    });
  }
  // print(getData().toString());

  setState(() {
    getData();
  });

    return Scaffold(
      appBar: AppBar(
        title: Text("Groupalike"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LandingPage())));
              },
              child: Icon(Icons.exit_to_app))
            )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: widget.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView(
                children: documents.map((doc) => Column(
                      children: [
                        SizedBox(height: 200),
                        Text("UID: ${doc['uid']}", style: TextStyle(fontSize: 18),),
                        Text("City: ${doc['city']}", style: TextStyle(fontSize: 18),),
                        Text("Name: ${doc['displayName']}", style: TextStyle(fontSize: 18),),
                        Text("Email: ${doc['userEmail']}", style: TextStyle(fontSize: 18),),
                        Text("Password: ${doc['password']}", style: TextStyle(fontSize: 18),),

                      ]))
                    .toList());
          } else if (snapshot.hasError) {
            print("ERrror");
          }
        }),
      ),
    );
  }
}
