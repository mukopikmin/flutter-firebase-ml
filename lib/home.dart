import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Flutter Firebase ML"),
      ),
      body: new Center(
          child: new Column(children: <Widget>[
        new RaisedButton(
          child: const Text("Launch Camera"),
          onPressed: () {
            Navigator.of(context).pushNamed("/capture");
          },
        ),
        new RaisedButton(
          child: const Text("Launch Meat Camera"),
          onPressed: () {
            Navigator.of(context).pushNamed("/capture/meat");
          },
        ),
        new RaisedButton(
          child: const Text("Launch Horse Camera"),
          onPressed: () {
            Navigator.of(context).pushNamed("/capture/horse");
          },
        ),
      ])),
    );
  }
}
