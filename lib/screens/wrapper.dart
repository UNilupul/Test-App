 import 'package:flutter/material.dart';
import 'package:my_app/screens/authentication/authenticate.dart';
import 'package:provider/provider.dart';

import '../models/UserModel.dart';
import 'home/home.dart';

 class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    // the user data that the provide provides this can be a user data or can be null.
    final user = Provider.of<UserModel?>(context);

    if (user == null){
      return const Authenticate();
    } else {
      return const Home();
    }
  }
} 