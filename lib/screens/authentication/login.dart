// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_app/constance/colors.dart';
import 'package:my_app/constance/descriptions.dart';
import 'package:my_app/constance/styles.dart';
import 'package:my_app/services/auth.dart';

class SignIn extends StatefulWidget {
  //function
  final Function toggle;

  const SignIn({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          title: const Text("SIGN IN"),
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
                const SizedBox(height: 25),
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
                          validator: (value) => value?.isEmpty == true
                              ? "Enter a valid Email"
                              : null,
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
                          decoration: textInputDecoration.copyWith(
                              hintText: "Password"),
                          validator: (value) => value!.length < 8
                              ? "Enter a valid password"
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
                          "Login with social accounts",
                          style: descriptionStyle,
                        ),
                        const SizedBox(height: 25),
                        GestureDetector(
                          //sign in with google
                          onTap: () {},
                          child: Center(
                            child: Image.asset(
                              'assets/google.png',
                              height: 50,
                            ),
                          ),
                        ),

                        //go register
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do not have an account?",
                              style: descriptionStyle,
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              // navigate register page
                              onTap: () {
                                widget.toggle();
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    color: mainBlue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),

                        // button
                        const SizedBox(height: 20),
                        GestureDetector(
                          // method for user login
                          onTap: () async {
                            dynamic result = await _auth
                                .signInUsingEmailAndPassword(email, password);

                            if (result == null) {
                              error = "Email and Password not found";
                            }
                          },
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              color: bgBlack,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: mainYellow, width: 2),
                            ),
                            child: const Center(
                              child: Text(
                                "Log-In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // sign in anon button
                        const SizedBox(height: 10),
                        GestureDetector(
                          // method for user login annon
                          onTap: () async {
                            await _auth.signInAnonymously();
                          },
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              color: bgBlack,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: mainYellow, width: 2),
                            ),
                            child: const Center(
                              child: Text(
                                "Log-In as a Guest",
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
        ));
  }
}



// ElevatedButton(
//         onPressed: () async {
//           dynamic result = await _auth.signInAnonymously();
//           if (result == Null) {
//             print("error in sign in anon");
//           } else {
//             print("signed in anon");
//             print(result.uid);
//           }
//         },
//         child: const Text("Sign In Anonymously"),
//       ),