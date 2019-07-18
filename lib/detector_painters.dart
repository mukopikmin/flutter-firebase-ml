// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' as ui;

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

enum Detector { barcode, face, label, cloudLabel, text }

class LabelDetectorPainter extends CustomPainter {
  LabelDetectorPainter(this.absoluteImageSize, this.labels, this.meatOnly, this.horseMode);

  final Size absoluteImageSize;
  final List<ImageLabel> labels;
  final bool meatOnly;
  final bool horseMode;

  @override
  void paint(Canvas canvas, Size size) {
    final ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
          textAlign: TextAlign.left,
          fontSize: 23.0,
          textDirection: TextDirection.ltr),
    );

    builder.pushStyle(ui.TextStyle(color: Colors.green));

    if (this.horseMode) {
      builder.addText('Label: Horsemeat, '
        'Confidence: 1.00\n');
    } else {
      for (ImageLabel label in labels) {
        RegExp regexp = new RegExp(r'beef|meat|chicken|food', caseSensitive: false);

        if (this.meatOnly) {
          if (regexp.hasMatch(label.text)) {
            builder.addText('Label: ${label.text}, '
                'Confidence: ${label.confidence.toStringAsFixed(2)}\n');
          }
        } else {
            builder.addText('Label: ${label.text}, '
                'Confidence: ${label.confidence.toStringAsFixed(2)}\n');
        }
      }
    }
    builder.pop();

    canvas.drawParagraph(
      builder.build()
        ..layout(ui.ParagraphConstraints(
          width: size.width,
        )),
      const Offset(0.0, 0.0),
    );
  }

  @override
  bool shouldRepaint(LabelDetectorPainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.labels != labels;
  }
}