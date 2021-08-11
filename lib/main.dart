import 'package:agenda_contatos/screens/home/home.dart';
import 'package:agenda_contatos/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: apptheme,
    ),
  );
}

