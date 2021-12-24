import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
    print('email: $_email | senha: $_password');
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void login() {
    if (validate()) {
      print('pode chamar o back end!!!');
    }
  }
}
