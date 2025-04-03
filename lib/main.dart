import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:state_management/user.dart';

final fetchUserProvider = FutureProvider((ref) {
  final userRepositery = ref.watch(userRepositeryProvider);
  return userRepositery.fetchUserData();
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
