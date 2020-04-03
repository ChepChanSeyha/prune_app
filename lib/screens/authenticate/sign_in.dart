import 'package:flutter/material.dart';
import 'package:prune_app/services/auth.dart';
import 'package:prune_app/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  bool _obscureText = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/icon.png',
                      height: MediaQuery.of(context).size.width * 0.5,
                      width: MediaQuery.of(context).size.width * 0.5,
                      scale: 1.0,
                    ),
                    SizedBox(
                      height: 50.0,
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
                    SizedBox(
                      height: 20.0,
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
                      color: Color(0xffE91403),
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
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
                      height: 50.0,
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
                              Text('Sign Up',
                                  style: TextStyle(
                                    color: Color(0xffE91403),
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
                ))),
      ),
    );
  }
}
