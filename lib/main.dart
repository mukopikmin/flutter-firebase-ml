
import 'package:flutter/material.dart';
import 'capture.dart';
import 'home.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(), // becomes the route named '/'
    routes: <String, WidgetBuilder> {
      // '/capture': (BuildContext context) => new Capture(),
      '/capture': (BuildContext context) =>
            CameraPreviewScanner(),
    },
  ));
}

