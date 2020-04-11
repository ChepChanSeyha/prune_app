import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prune_app/screens/home/home.dart';
import '../../shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
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
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
                  child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icon2.png',
                            height: MediaQuery.of(context).size.width * 0.4,
                            width: MediaQuery.of(context).size.width * 0.4,
                            scale: 1.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Email*',
                                hintText: "chepchanseyha@gmail.com",
                                icon: Icon(Icons.email)),
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
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    semanticLabel: _obscureText
                                        ? 'show password'
                                        : 'hide password',
                                  ),
                                ),
                                labelText: 'Password*',
                                hintText: "********",
                                icon: Icon(Icons.lock)),
                            controller: pwdInputController,
                            obscureText: _obscureText,
                            validator: pwdValidator,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RaisedButton(
                            color: Colors.red,
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_loginFormKey.currentState.validate()) {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emailInputController.text,
                                        password: pwdInputController.text)
                                    .then((currentUser) => Firestore.instance
                                        .collection("users")
                                        .document(currentUser.user.uid)
                                        .get()
                                        .then((DocumentSnapshot result) =>
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home())))
                                        .catchError((err) => print(err)))
                                    .catchError((err) => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Error"),
                                            content: Text(
                                                "That account doesn't exist. Enter a different account or get a new one."),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text("Close"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          );
                                        }));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content:
                                            Text("Wrong Email Or Password"),
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
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Text('Register',
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Register later', style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline),),
                        ],
                      ))),
            ),
          );
  }
}
