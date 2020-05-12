import 'package:flutter/material.dart';
import 'package:mymusichub/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

final AuthService _auth = AuthService();

//text field state

String email = '';
String password = '';

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        backgroundColor: Color.fromRGBO(201, 204, 207, 1.0),

        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30.0),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.png'),
                    radius: 80,
                  ),
                  SizedBox(height: 10.0),
                  Text('MY MUSIC HUB',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'BioRyhme',
                      )),
                  TextFormField(
                      onChanged: (val){
                        setState(() => email = val);
                      }
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                      obscureText: true,
                      onChanged: (val){
                        setState(() => password = val);
                      }
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(40, 12, 40, 12),
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

                        },

                      ),
                      SizedBox(
                        width: 18,
                      ),
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
                          print(email);
                          print(password);
                        },

                      ),
                    ],


                  ),

                ],
              )
          ),
        ),
      ),
    );
  }
}
