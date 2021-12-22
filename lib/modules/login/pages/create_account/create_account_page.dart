import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/button.dart';
import 'package:meuapp/shared/widgets/input_text.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: BackButton(color: AppTheme.colors.backButton),
      ),
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text('Criando uma conta', style: AppTheme.textStyles.title),
            SizedBox(height: 18),
            Text('Mantenha seus gastos em dia',
                style: AppTheme.textStyles.subtitle),
            SizedBox(height: 38),
            InputText(label: 'Nome', hint: 'Digitel seu nome completo'),
            SizedBox(height: 18),
            InputText(label: 'E-mail', hint: 'Digitel seu e-mail'),
            SizedBox(height: 18),
            InputText(label: 'Senha', hint: 'Digitel sua senha', obscure: true,),
            Button(
              label: 'Criar conta',
              onTap: () {
                print('Criar conta.');
              },
            ),
          ],
        ),
      ),
    );
  }
}
