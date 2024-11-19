import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_musik_john_lennon/screens/login.dart';
import 'package:toko_musik_john_lennon/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Toko Musik John lennon',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ).copyWith(secondary: Colors.deepPurple[400]),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
