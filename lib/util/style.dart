import 'package:flutter/material.dart';

ButtonStyle filledSoftButtonStyle() {
  return FilledButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    minimumSize: Size.fromHeight(50),
  );
}

ButtonStyle outlinedSoftButtonStyle() {
  return OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    minimumSize: Size.fromHeight(50),
  );
}

TextStyle softButtonTextStyle() {
  return TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
}
