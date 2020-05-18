import 'package:flutter/material.dart';
import 'package:mymusichub/services/auth.dart';
import 'package:mymusichub/shared/constants.dart';
import 'package:mymusichub/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading = false;

//text field state

String email = '';
String password = '';
String error = '';

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: Scaffold(
      resizeToAvoidBottomPadding: false,
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
                      Expanded(
                        flex: 10,
                        child: TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Username'),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                      ),
                      Expanded(
                        flex: 0,
                        child: TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                      ),
                      SizedBox(height: 25.0),
                      Expanded(
                        flex: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(110, 12, 110, 12),
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
                                //register !!!!
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  setState(() {
                                    error =
                                        'Could not register with those credentials';
                                    loading = false;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(40, 12, 40, 12),
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
                  ),
                ),
              ),
            ),
        );
  }
}
