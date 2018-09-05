import 'package:flutter/material.dart';
import './ui/home.dart';

void main(){
  runApp(new MaterialApp(
    title: 'BMI',
    theme: ThemeData(fontFamily:'phetsarath_ot'),
    home: new Bmi(),
  ));
}