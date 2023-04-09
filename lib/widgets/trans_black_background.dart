import 'package:flutter/material.dart';

Widget transBlackBackground(Widget child) {
  return SafeArea(
    child: Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black87, Colors.black],
          stops: [0.1, 0.9],
        ),
      ),
      child: child,
    ),
  );
}