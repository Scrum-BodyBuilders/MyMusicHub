import 'package:flutter/material.dart';
import 'package:mymusichub/screens/authenticate/authenticate.dart';
import 'package:mymusichub/services/auth.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var projectName = 'My Project 1';
  Color myMusicRed = Color(0xfff00000);
  Color myMusicGrey = Color(0xfCC8CCD0);
  Color myMusicLightGrey = Color(0xfEEDEDED);
  Color myMusicBlack = Color(0xf04F4A49);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myMusicGrey,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: myMusicGrey,
          title: new Text(
            "My Project 1",
            style: TextStyle(
                fontFamily: 'BioRyhme', fontSize: 28, color: Colors.black),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.menu),
            iconSize: 40,
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
        ),
      ),
      drawer: new Drawer(
        child: Container(
          color: myMusicBlack,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Row(
                  children: [
                    Text('MyMusicHub', style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                height: 2,
              )
            ],

          ),
        ),
      ),
      body: SlidingUpPanel(
          minHeight: 50,
          maxHeight: 600,
          collapsed: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
          panel: Container(
            padding: EdgeInsets.all(60),
            color: Colors.grey[300],
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NAME',
                      style: TextStyle(
                          fontFamily: 'BioRyhme',
                          color: myMusicRed,
                          fontSize: 25),
                    ),
                    Text(
                      projectName,
                      style: TextStyle(fontFamily: 'BioRyhme', fontSize: 20),
                    ),
                    Divider(
                      thickness: 2,
                      height: 30,
                      color: Colors.black,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PHOTOS',
                      style: TextStyle(
                          fontFamily: 'BioRyhme',
                          color: myMusicRed,
                          fontSize: 25),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 210,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Image.asset('images/score_0.png'),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset('images/score_0.png'),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset('images/score_0.png'),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset('images/score_0.png'),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        Container(
                          color: myMusicGrey,
                          height: 60,
                          width: 60,
                          child: IconButton(
                              icon: new Icon(
                                Icons.add_a_photo,
                                color: myMusicRed,
                                size: 40,
                              ),
                              onPressed: null),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      height: 30,
                      color: Colors.black,
                    ),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    'NOTES',
                    style: TextStyle(
                        fontFamily: 'BioRyhme',
                        color: myMusicRed,
                        fontSize: 25),
                  ),
                ]),
              ],
            ),
          )),
    );
  }
}
