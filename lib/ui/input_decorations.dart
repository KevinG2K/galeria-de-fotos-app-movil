import 'package:flutter/material.dart';

// Esta clase manejar metodos y propiedades estaticas
//  De tal manera de que no se necesita crear una instancia de la clase para usarla
// Simplemente se hace referencia al nombre
class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2
        )
      ),
      // placeholder
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.grey
      ),
      prefixIcon: prefixIcon != null
      ? Icon( prefixIcon, color: Colors.deepPurple)
      : null
    );
  }
}