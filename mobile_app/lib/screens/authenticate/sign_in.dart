import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prune_app/screens/home/home.dart';
import 'package:prune_app/screens/home/loading.dart';
import 'package:prune_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  // Text field state
  String email = '';
  String password = '';
  String error = '';

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
              scrollDirection: Axis.vertical,
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
                            validator: (val) =>
                                val.isEmpty ? 'Enter your email' : null,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              icon: Icon(Icons.email),
                            ),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter your Password' : null,
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
                                hintText: 'Password',
                                icon: Icon(Icons.vpn_key)),
                            obscureText: _obscureText,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RaisedButton(
                            color: Color(0xff5BBDF4),
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_loginFormKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth
                                    .signInWithEmailAndPassword(email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Invalid email or password';
                                    loading = false;
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
                          Text(
                            'Register later',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ))),
            ),
          );
  }
}
