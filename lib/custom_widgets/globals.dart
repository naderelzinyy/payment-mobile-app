import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseURL = "http://localhost:8000/api"; //emulator localhost
const Map<String, String> headers = {
  "Content-Type": "application/json",
  "accept": "application/json"
};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
