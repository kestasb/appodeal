import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppodealBanner extends StatelessWidget {
  final double width;
  final double height;
  final Map<String, dynamic> _args = {};

  AppodealBanner({
    this.width = 320,
    this.height = 50,
    String? placementName,
  }) {
    this._args["placementName"] = placementName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // color: Colors.red,
      child: Platform.isIOS
          ? UiKitView(
              viewType: 'plugins.io.vinicius.appodeal/banner',
              creationParams: this._args,
              creationParamsCodec: const StandardMessageCodec(),
            )
          : AndroidView(
              viewType: 'plugins.io.vinicius.appodeal/banner',
              creationParams: this._args,
              creationParamsCodec: const StandardMessageCodec(),
            ),
    );
  }
}
