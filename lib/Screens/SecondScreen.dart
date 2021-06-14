import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo1/global/global.dart' as globalData;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        actions: [
          InkWell(
            child: Icon(
              Icons.close,
              size: 40,
              color: Colors.red,
            ),
            onTap: () {
              SystemNavigator.pop();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${globalData.name} to Second screen"),
            SizedBox(
              height: 20,
            ),
            Text('Please visit our website to register'),
          ],
        ),
      ),
    );
  }
}
