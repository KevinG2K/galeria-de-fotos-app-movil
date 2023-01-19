// ignore_for_file: unnecessary_new, avoid_print

import 'package:flutter/material.dart';


class LoginFormProvider extends ChangeNotifier {

  // conectar el Form con este provider, gracias a la Key
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email    = '';
  String password = '';
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  // modifica el componente (widget)
  set isLoading( bool value ) {
    _isLoading = value;
    // redibuja el widget del login basado en la logica que se realiza
    notifyListeners();
  }

  // regresa true si el form es valido
  bool isValidForm() {

    print(formKey.currentState?.validate());

    print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }

}