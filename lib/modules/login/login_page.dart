import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/button.dart';
import 'package:meuapp/shared/widgets/input_text.dart';

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
            InputText(label: 'E-mail', hint: 'Digitel seu e-mail'),
            SizedBox(height: 18),
            InputText(label: 'Senha', hint: 'Digitel sua senha'),
            Button(label: 'Entrar'),
            Button(label: 'Criar conta', type: ButtonType.outline,),
          ],
        ),
      ),
    );
  }
}
