import 'package:flutter/material.dart';

import '../pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => const UsuariosPage(),
  'loading': (_) => const LoadingPage(),
  'register': (_) => const RegisterPage(),
  'chat': (_) => const ChatPage(),
  'login': (_) => const LoginPage(),
};
