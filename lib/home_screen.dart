import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/main.dart';
import 'package:state_management/user.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void onSubmit(WidgetRef ref, String value) {
    // ref.read(nameProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Column(
        children: [
          TextField(onSubmitted: (value) => onSubmit(ref, value)),
          Center(child: Text(user.age.toString())),
        ],
      ),
    );
  }
}
