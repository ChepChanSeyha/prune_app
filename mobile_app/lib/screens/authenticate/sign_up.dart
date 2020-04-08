import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prune_app/screens/home/home.dart';
import 'package:prune_app/screens/home/profile.dart';

import '../../services/auth.dart';
import '../../shared/loading.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({Key key, this.toggleView}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  @override
  initState() {
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
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

  // Text field state
  String email = '';
  String password = '';
  String telephone = '';
  String error = '';

  bool _obscureText = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Form(
                key: _registerFormKey,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/icon.png',
                      height: MediaQuery.of(context).size.width * 0.5,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'First Name*', hintText: "John", icon: Icon(Icons.perm_identity)),
                      controller: firstNameInputController,
                      validator: (value) => value.length < 3
                          ? "Please enter a valid first name."
                          : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Last Name*', hintText: "Doe", icon: Icon(Icons.perm_identity)),
                      controller: lastNameInputController,
                      validator: (value) => value.length < 3
                          ? "Please enter a valid last name."
                          : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email*', hintText: "john.doe@gmail.com", icon: Icon(Icons.email)),
                      controller: emailInputController,
                      keyboardType: TextInputType.emailAddress,
                      validator: emailValidator,
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
                          ), labelText: 'Password*', hintText: "********", icon: Icon(Icons.vpn_key)),
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
                          ), labelText: 'Confirm Password*', hintText: "********", icon: Icon(Icons.vpn_key)),
                      controller: confirmPwdInputController,
                      obscureText: true,
                      validator: pwdValidator,
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
                              "fname": firstNameInputController.text,
                              "surname": lastNameInputController.text,
                              "email": emailInputController.text,
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
                                    color: Color(0xff5BBDF4),
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
              ))),
    );
  }
}
