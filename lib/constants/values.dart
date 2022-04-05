
import 'package:flutter/material.dart';

extension ScreenComponent on BuildContext{

  double get paddingTop => MediaQuery.of(this).padding.top;

}