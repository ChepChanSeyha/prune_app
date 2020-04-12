import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prune_app/screens/home/home.dart';
import 'package:prune_app/screens/home/profile.dart';

import '../../services/auth.dart';
import '../home/loading.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({Key key, this.toggleView}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController fullNameInputController;
  TextEditingController emailInputController;
  TextEditingController locationInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  @override
  initState() {
    fullNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    locationInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  bool _obscureText = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
            child: Form(
              key: _registerFormKey,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/icon2.png',
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Full name*', hintText: "Chep Chanseyha", icon: Icon(Icons.account_circle)),
                    controller: fullNameInputController,
                    validator: (value) => value.length < 3
                        ? "Please enter a valid first name."
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email*', hintText: "chepchanseyha@gmail.com", icon: Icon(Icons.email)),
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Location*', hintText: "Phnom Penh, Cambodia", icon: Icon(Icons.location_on)),
                    controller: locationInputController,
                    validator: (value) => value.length < 5
                        ? "Please enter the right location"
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                            semanticLabel:
                            _obscureText ? 'show password' : 'hide password',
                          ),
                        ), labelText: 'Password*', hintText: "********", icon: Icon(Icons.lock)),
                    controller: pwdInputController,
                    obscureText: _obscureText,
                    validator: pwdValidator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                            semanticLabel:
                            _obscureText ? 'show password' : 'hide password',
                          ),
                        ), labelText: 'Confirm Password*', hintText: "********", icon: Icon(Icons.lock)),
                    controller: confirmPwdInputController,
                    obscureText: true,
                    validator: pwdValidator,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text("Register"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_registerFormKey.currentState.validate()) {
                        if (pwdInputController.text ==
                            confirmPwdInputController.text) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: emailInputController.text,
                              password: pwdInputController.text)
                              .then((currentUser) => Firestore.instance
                              .collection("users")
                              .document(currentUser.user.uid)
                              .setData({
                            "uid": currentUser.user.uid,
                            "fullname": fullNameInputController.text,
                            "email": emailInputController.text,
                            "location": locationInputController.text,
                          }).then((result) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
                              Profile()), (_) => false),))
                              .catchError((err) => print(err))
                              .catchError((err) => print(err));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("The passwords do not match"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already haved an account? ',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Text('Sign In',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ))
                          ],
                        ),
                        onTap: () {
                          widget.toggleView();
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
