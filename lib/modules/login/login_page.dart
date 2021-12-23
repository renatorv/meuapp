import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/button.dart';
import 'package:meuapp/shared/widgets/input_text.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200),
            InputText(
              label: 'E-mail',
              hint: 'Digitel seu e-mail',
              onChanged: print,
              validator: (valor) =>
                  isEmail(valor) ? null : 'Digite um e-mail válido.',
            ),
            SizedBox(height: 18),
            InputText(
              label: 'Senha',
              hint: 'Digitel sua senha',
              obscure: true,
              onChanged: print,
              validator: (valor) =>
                  isLength(valor, 6) ? null : 'A senha deve conter no mínimo 6 caracteres.',
            ),
            Button(
              label: 'Entrar',
              onTap: () {
                print('Entrar');
              },
            ),
            Button(
              label: 'Criar conta',
              type: ButtonType.outline,
              onTap: () {
                Navigator.pushNamed(context, "/login/create-account");
              },
            ),
          ],
        ),
      ),
    );
  }
}
