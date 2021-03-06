import 'package:flutter/cupertino.dart';

import 'package:meuapp/modules/login/repositories/login_repository.dart';
import 'package:meuapp/shared/utils/app_state.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;

  AppState state = AppState.empty();

  final formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  LoginController({required this.repository});

  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
    // print('email: $_email | senha: $_password');
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> login() async {
    if (validate()) {
      try {
        update(AppState.loading());
        // CHAMADA DO BACK END
        // await AppDatabase.instance.login(email: _email, password: _password);
        await repository.login(email: _email, password: _password);
        update(AppState.success<String>('Usuário logado!!'));
      } catch (e) {
        update(
          AppState.error('Não foi possível realizar o login!!'),
        );
      }
    }
  }
}
