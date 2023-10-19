import 'package:flutter/material.dart';

double Function(BuildContext context) getDeviceHeight =
    (BuildContext context) => MediaQuery.of(context).size.height as double;
double Function(BuildContext context) getDeviceWidth =
    (BuildContext context) => MediaQuery.of(context).size.width as double;
