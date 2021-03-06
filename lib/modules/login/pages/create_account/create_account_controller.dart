import 'package:flutter/cupertino.dart';
import 'package:meuapp/modules/login/repositories/login_repository.dart';
import 'package:meuapp/shared/utils/app_state.dart';

class CreateAccountController extends ChangeNotifier {
  final LoginRepository repository;
  CreateAccountController({required this.repository});
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = '';

  void onChange({String? email, String? password, String? name}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _name = name ?? _name;
    // print('email: $_email | senha: $_password | nome: $_name');
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> createAccount() async {
    if (validate()) {
      try {
        update(AppState.loading());
        // await AppDatabase.instance
        //     .createAccount(email: _email, password: _password, name: _name);
        await repository.createAccount(email: _email, password: _password, name: _name);
        update(AppState.success<String>("Deu certo!!"));
      } catch (e) {
        update(AppState.error("Não foi possível criar conta."));
      }
    }
  }
}
