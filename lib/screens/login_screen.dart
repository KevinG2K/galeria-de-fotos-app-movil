// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fotografia/providers/login_form_provider.dart';
import 'package:provider/provider.dart';
import 'package:fotografia/ui/input_decorations.dart';
import 'package:fotografia/widgets/widgets.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30),
                    ChangeNotifierProvider(
                      // Crea instancia del LoginFormProvider
                      create: ( _ ) => LoginFormProvider(),
                      child: _LoginForm(),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 50),
              Text('Crear una cuenta nueva', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 50)
            ],
          ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    // Con este loginForm se tiene acceso a toda la clase LoginFormProvider
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        
        // apunta al formKey del provider
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // Column, xq quiero switches, uno debajo del otro.
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'ejemplo@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              // toma el valor del email
              onChanged: (value) => loginForm.email = value,
              validator: (value) {

                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                ? null
                : 'No tiene el formato de un correo electronico';
              },
            ),

            SizedBox(height: 30),

            TextFormField(
              autocorrect: false,
              // oculta la contraseña
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              // toma el valor del password
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                
                return ( value != null && value.length >= 4 )
                ? null
                : 'La contraseña debe ser mayor a 4 caracteres';
                
              },
            ),

            SizedBox(height: 30),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading
                  ? 'Espere'
                  : 'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: loginForm.isLoading ? null : () async {

                FocusScope.of(context).unfocus();

                if (!loginForm.isValidForm()) return; 

                loginForm.isLoading = true;

                await Future.delayed(Duration(seconds: 2));

                // Validar si el login es correcto (Backend)
                loginForm.isLoading = false;
                
                Navigator.pushReplacementNamed(context, 'home');
              }
              )
          ],
        ),
      ),
    );
  }
}