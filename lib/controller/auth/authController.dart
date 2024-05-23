import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailController extends GetxController{
  var userEmail = ''.obs;
  var isValid = false.obs;

  void updateEmail(String value){
    userEmail.value=value;
    isValid.value = _validateEmail(value);
  }

  bool _validateEmail(String email){
    String emailPattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }
}