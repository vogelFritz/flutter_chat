import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 5,
              )
            ]),
        child: const TextField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail_outline),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: 'Correo electrónico'),
        ));
  }
}
