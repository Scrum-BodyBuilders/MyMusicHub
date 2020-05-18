import 'package:mymusichub/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:mymusichub/shared/constants.dart';
import 'package:mymusichub/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
//        appBar: AppBar(
//          title: Text("Sign In"),
//        ),
            backgroundColor: Color.fromRGBO(201, 204, 207, 1.0),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 55.0),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        radius: 80,
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
                        flex: 10,
                        child: Text('MY MUSIC HUB',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'BioRyhme',
                            )),
                      ),
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                      ),
                      SizedBox(height: 20.0),
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                      ),
                      SizedBox(height: 25.0),
                      Expanded(
                        flex: 20,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RaisedButton(
                                  padding: EdgeInsets.fromLTRB(110, 12, 110, 12),
                                  child: Text('Sign In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'BioRyhme',
                                      )),
                                  color: Color.fromRGBO(38, 50, 56, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result =
                                          await _auth.signInWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              'Could not sign in with those credentials';
                                          loading = false;
                                        });
                                      }
                                    }
                                  },
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  onPressed: null,
                                  child: Text(
                                    'Forgot your password ?',
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(60, 12, 60, 12),
                              child: Text('Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'BioRyhme',
                                  )),
                              color: Color.fromRGBO(207, 49, 67, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () async {
                                widget.toggleView();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                          fontFamily: 'BioRyhme',
                        ),
                      ),
                    ],
                  )),
            ),
          );
  }
}
