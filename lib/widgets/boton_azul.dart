import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const BotonAzul({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) => 2),
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.blue),
          shape: MaterialStateProperty.resolveWith(
              (states) => const StadiumBorder()),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                )),
          ),
        ));
  }
}
