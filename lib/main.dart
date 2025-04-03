import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/user.dart';

final fetchUserProvider = FutureProvider((ref) {
  //When making HTTP requests in Dart/Flutter,
  // you need to convert a string URL into a URI object.
  const url = "https://jsonplaceholder.typicode.com/users";
  return http
      .get(Uri.parse(url))
      .then(
        (value) => User.fromJson(value.body),
      ); // 'get' expects a 'Uri', not a string.
});

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RiverPod',
      home: const HomeScreen(),
    );
  }
}
