import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String titulo;
  final String subTitulo;
  final String route;
  const Labels({
    super.key,
    required this.route,
    required this.titulo,
    required this.subTitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(titulo,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, route);
          },
          child: Text(subTitulo,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
