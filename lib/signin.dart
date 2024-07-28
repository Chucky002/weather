import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weathwerappwithlioin/home.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

TextEditingController email = TextEditingController();
TextEditingController pas = TextEditingController();

class _SigninState extends State<Signin> {
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
                  try {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
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
                                content:
                                    Text('the error is ${error.toString()}'),
                              );
                            }));
                  } catch (e) {
                    print(e);
                  }
                },
                style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      BeveledRectangleBorder(side: BorderSide.none),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(Color.fromARGB(178, 0, 0, 0))),
                child: const Text(
                  'Sing IN',
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
                child: const Text('sign up'))
          ],
        ),
      ),
    );
  }
}
