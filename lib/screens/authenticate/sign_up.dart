import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prune_app/screens/home/home.dart';
import 'package:prune_app/services/auth.dart';
import 'package:prune_app/shared/loading.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController fullNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController locationInputController;

  @override
  initState() {
    fullNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    locationInputController = new TextEditingController();
    super.initState();
  }

  bool _obscureText = true;
  bool loading = false;
  String error = '';

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
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icon.png',
                            height: MediaQuery.of(context).size.width * 0.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter your email' : null,
                            decoration: InputDecoration(
                                hintText: 'Email', icon: Icon(Icons.email)),
                            controller: emailInputController,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (val) =>
                            val.isEmpty ? 'Enter your full name' : null,
                            decoration: InputDecoration(
                                hintText: 'Full name', icon: Icon(Icons.account_circle)),
                            controller: fullNameInputController,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (val) => val.length < 6
                                ? 'Password must more than 6 characters'
                                : null,
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
                            controller: pwdInputController,
                            obscureText: _obscureText,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter your location' : null,
                            decoration: InputDecoration(
                                hintText: 'Location',
                                icon: Icon(Icons.location_on)),
                            controller: locationInputController,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RaisedButton(
                            color: Color(0xffE91403),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: emailInputController.text, password: pwdInputController.text).then((currentUser) => Firestore.instance
                                        .collection("users")
                                        .document(currentUser.user.uid)
                                        .setData({
                                      "uid": currentUser.user.uid,
                                      "fullName": fullNameInputController.text,
                                      "location": locationInputController.text,
                                    }).then((result) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
                                        Home()), (_) => false),))
                                        .catchError((err) => print(err))
                                        .catchError((err) => print(err));;
                                if (result == null) {
                                  setState(() {
                                    error = 'Something went wrong';
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
                                'Already have an account? ',
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Text('Sign In',
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
                              ),
                            ],
                          ),
                        ],
                      ))),
            ),
          );
  }
}
