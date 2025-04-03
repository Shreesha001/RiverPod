import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/main.dart';
import 'package:state_management/user.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);
    return user.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [Center(child: Text(data.email))]),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(body: Center(child: Text(error.toString())));
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
