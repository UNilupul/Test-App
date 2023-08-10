import 'package:flutter/material.dart';
import 'package:my_app/constance/colors.dart';

const TextStyle descriptionStyle = TextStyle(
  fontSize: 15,
  color: textLight,
  fontWeight: FontWeight.w200
);

const textInputDecoration = InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: textLight,
                            fontSize: 15,
                          ),
                          fillColor: bgBlack,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mainYellow,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mainYellow,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        );