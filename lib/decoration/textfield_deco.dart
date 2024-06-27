import 'package:flutter/material.dart';

final myTextFormFieldDeco = InputDecoration(
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ),
  prefixIcon: const Icon(
    Icons.get_app,
    color: Color.fromARGB(255, 0, 0, 0),
  ),
  hintText: 'Enter Name',
  hintStyle: const TextStyle(color: Colors.black),
  labelText: 'Enter Name',
  labelStyle: const TextStyle(color: Colors.black),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(25),
  ),
  floatingLabelAlignment: FloatingLabelAlignment.center,
);

const myTextDeco = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
