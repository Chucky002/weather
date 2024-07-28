import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weathwerappwithlioin/signin.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    {
      return Center(
        child: TextButton.icon(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Signin())));
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text('leave')),
      );
    }
  }
}
