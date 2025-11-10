import 'package:flutter/material.dart';

ButtonStyle makeFilledPageButtonStyle() {
  return FilledButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    fixedSize: Size.fromHeight(50),
  );
}

ButtonStyle makeOutlinedPageButtonStyle() {
  return OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    fixedSize: Size.fromHeight(50),
  );
}
