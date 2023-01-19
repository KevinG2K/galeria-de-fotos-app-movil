// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, unused_element, prefer_const_constructors, sort_child_properties_last, unnecessary_this

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground({
    Key? key,
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      width: double.infinity,
      height: double.infinity,
      // Stack, nos permite colocar widgets, uno encima de otro
      child: Stack(
        children: [
          _PurpleBox(),

          _HeaderIcon(),

          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100,),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      // Todo el ancho que pueda
      width: double.infinity,
      // Toma el 40%
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30,),
          Positioned(child: _Bubble(), top: -40, left: -30,),
          Positioned(child: _Bubble(), top: -50, right: -20,),
          Positioned(child: _Bubble(), bottom: -50, left: 10,),
          Positioned(child: _Bubble(), bottom: 120, right: 20,),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: LinearGradient(
      // ignore: prefer_const_literals_to_create_immutables
      colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}

class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}