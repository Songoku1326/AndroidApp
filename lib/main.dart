import 'package:demo1/Screens/FirstScreen.dart';
import 'package:demo1/Screens/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo1/global/global.dart' as globalData;

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/HomeScreen",
      routes: {
        "/HomeScreen": (context) => Demo(),
        "/FirstScreen": (context) => FirstScreen(),
        "/SecondScreen": (context) => SecondScreen(),
      },
      //home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String globalValue = 'initial';
  final _fkey = GlobalKey<FormState>();

  launchUrl(String url) {
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
            child: Column(
          children: [
            DrawerHeader(child: Container(height: 200, color: Colors.blue)),
            ListTile(
              title: Text('Login'),
              leading: Icon(Icons.login),
              onTap: () {
                setState(() {
                  globalValue = 'User has logged in';
                });
              },
              onLongPress: () {
                setState(() {
                  globalValue = 'No long press option';
                });
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                setState(() {
                  globalValue = 'User has logged out';
                });
              },
              onLongPress: () {
                setState(() {
                  globalValue = 'No long press option';
                });
              },
            ),
            ListTile(
              title: Text('Updates'),
              leading: Icon(Icons.update),
              onTap: () {
                setState(() {
                  globalValue = 'User has some updates';
                });
              },
              onLongPress: () {
                setState(() {
                  globalValue = 'No long press option';
                });
              },
            ),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
              onTap: () {
                String urlString = "https://www.youtube.com/";
                launchUrl(urlString);
              },
            )
          ],
        )),
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[300],
          title: Text(
            'Task 2 DemoApp',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          actions: [
            InkWell(
              child: Icon(Icons.help, size: 35),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Image.asset(
                'assets/images/login.png',
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1, left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    child: Form(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                        onChanged: (value) {
                          setState(() {
                            globalData.name = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Form(
                      key: _fkey,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Invalid username or password';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment(1, 0),
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: InkWell(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 8,
                      child: GestureDetector(
                          onTap: () {
                            if (_fkey.currentState!.validate()) {
                              Fluttertoast.showToast(
                                  msg: "Its good to proceed",
                                  backgroundColor: Colors.purpleAccent);
                              Navigator.pushNamed(context, "/FirstScreen");
                            }
                          },
                          child: Center(
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New User?  ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/SecondScreen");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
