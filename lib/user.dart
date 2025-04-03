// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class User {
  final String name;
  final String email;
  User({required this.name, required this.email});

  User copyWith({String? name, String? email}) {
    return User(name: name ?? this.name, email: email ?? this.email);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(name: map['name'] as String, email: map['email'] as String);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

final userRepositeryProvider = Provider((ref) => userRepositery());

class userRepositery {
  Future<User> fetchUserData() {
    //When making HTTP requests in Dart/Flutter,
    // you need to convert a string URL into a URI object.
    const url = "https://jsonplaceholder.typicode.com/users/1";
    return http
        .get(Uri.parse(url))
        .then(
          (value) => User.fromJson(value.body),
        ); // 'get' expects a 'Uri', not a string.
  }
}
