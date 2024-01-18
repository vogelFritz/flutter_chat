import 'package:chat/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Logo(),
            _Form(),
            _Labels(),
            Text('Términos y condiciones de uso',
                style: TextStyle(fontWeight: FontWeight.w200))
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 170,
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Image(image: AssetImage('assets/tag-logo.png')),
                SizedBox(height: 20),
                Text('Messenger', style: TextStyle(fontSize: 30)),
              ],
            )));
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        const CustomInput(),
        ElevatedButton(onPressed: () {}, child: const Icon(Icons.send)),
      ]),
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('¿No tenés cuenta?',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        Text('¡Crea una ahora!',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
