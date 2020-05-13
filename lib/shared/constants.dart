import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor:  Color.fromRGBO(201, 204, 207, 1.0),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
);

