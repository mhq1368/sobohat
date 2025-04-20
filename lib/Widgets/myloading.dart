import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

SpinKitDualRing mainLoading(double appHeight) {
  return SpinKitDualRing(
    color: Colors.white,
    size: appHeight / 15,
  );
}
