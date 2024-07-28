import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weathwerappwithlioin/home.dart';
import 'package:weathwerappwithlioin/signin.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

TextEditingController email = TextEditingController();
TextEditingController pas = TextEditingController();

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email.',
                  border: InputBorder.none,
                  icon: Icon(Icons.email, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue[200],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: pas,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  border: InputBorder.none,
                  icon: Icon(Icons.password, color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email.text, password: pas.text)
                      .then((value) => setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const Home()));
                          }))
                      .onError((error, stackTrace) => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('erro de o '),
                              content: Text('the error is $error'),
                            );
                          }));
                },
                style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      BeveledRectangleBorder(side: BorderSide.none),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(Color.fromARGB(178, 0, 0, 0))),
                child: const Text(
                  'Sing Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Signin()));
                },
                child: const Text('sign in'))
          ],
        ),
      ),
    );
  }
}
