// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constance/colors.dart';
import '../../constance/descriptions.dart';
import '../../constance/styles.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  //function
  final Function toggle;
  const Register({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // ref for the AthService class
  final AuthServices _auth = AuthServices();

  //create form key
  final _formKey = GlobalKey<FormState>();

  //email password state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: const Text("REGISTER"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              //description
              const Text(
                textAlign: TextAlign.center,
                description,
                style: descriptionStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset(
                  'assets/man.png',
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // email
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: textInputDecoration,
                        validator: (value) =>
                            value!.isEmpty ? "Enter a valid Email" : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),

                      // password
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration:
                            textInputDecoration.copyWith(hintText: "Password"),
                        validator: (value) => value!.length < 8
                            ? "Password must be at least 8 charachters"
                            : null,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      const SizedBox(height: 5),

                      // show error
                      Text(
                        error,
                        style: const TextStyle(color: Colors.red),
                      ),

                      // google
                      const SizedBox(height: 20),
                      const Text(
                        "Register with social accounts",
                        style: descriptionStyle,
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        //register in with google
                        onTap: () {},
                        child: Center(
                          child: Image.asset(
                            'assets/google.png',
                            height: 50,
                          ),
                        ),
                      ),

                      //go login
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Do you have an account?",
                            style: descriptionStyle,
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            // navigate login page
                            onTap: () {
                              widget.toggle();
                            },
                            child: const Text(
                              "Log-In",
                              style: TextStyle(
                                  color: mainBlue, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      // button
                      const SizedBox(height: 20),
                      GestureDetector(
                        // method for user register
                        onTap: () async {
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);

                          if (result == null) {
                            // show error
                            setState(() {
                              error = "Please enter valid email";
                            });
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: mainYellow,
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
