import 'package:flutter/material.dart';

import 'package:test_project/Theme.dart';

InputDecoration cTextInputDecoration = InputDecoration(
  border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(15), // Sets the border radius of the text field

      //Creates an invisible border that allows the text field to have rounded edges
      borderSide: const BorderSide(
        width: 0, // Sets the width of the border to 0 (no border)
        style: BorderStyle.none, // Sets the border style to none
      )),
  filled: true, // Sets the field to be filled
  fillColor: TestAppColour
      .primaryGreen, // Sets the background color of the field (if filled=true)

  // Sets the style of the hint text
  hintStyle:
      const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300),
);

const InputDecoration cBlankTextInputDecoration = InputDecoration(
  border: InputBorder.none,
);

BoxBorder outlinedBoxBorder = Border.all(
    color: TestAppColour.primaryPurple, width: 1, style: BorderStyle.solid);
