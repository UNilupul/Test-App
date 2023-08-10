import 'package:flutter/material.dart';
import 'package:my_app/constance/colors.dart';
import 'package:my_app/constance/descriptions.dart';
import 'package:my_app/constance/styles.dart';
import 'package:my_app/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //create a object from AuthService
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          backgroundColor: bgBlack,
          elevation: 0,
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(bgBlack),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
              child: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                textAlign: TextAlign.center,
                description,
                style: descriptionStyle,
              ),
              const SizedBox(height: 30),
              Image.asset(
                "assets/man.png",
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
