import 'package:flutter/material.dart';
import 'package:mymusichub/screens/authenticate/authenticate.dart';
import 'package:mymusichub/services/auth.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  var projectName = 'My Project 1';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(projectName),
      ),
      body: SlidingUpPanel(
        minHeight: 50,
        maxHeight: 600,
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],

          ),
        ),
        panel: Text('text'),
      ),
    ));
  }
}
