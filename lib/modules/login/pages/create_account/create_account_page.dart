import 'package:flutter/material.dart';
import 'package:meuapp/modules/login/pages/create_account/create_account_controller.dart';
import 'package:meuapp/modules/login/repositories/login_repository_impl.dart';
import 'package:meuapp/shared/services/app_database.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/button.dart';
import 'package:meuapp/shared/widgets/input_text.dart';
import 'package:validators/validators.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = CreateAccountController(
        repository: LoginRepositoryImpl(AppDatabase.instance));

    controller.addListener(() {
      controller.state.when(
        success: (value) => Navigator.pushNamed(context, '/home'),
        error: (message, _) => scaffoldKey.currentState!.showBottomSheet(
          (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Container(
              child: Text(message),
            ),
          ),
        ),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: BackButton(color: AppTheme.colors.backButton),
      ),
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: controller.formKey,
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
              InputText(
                label: 'Nome',
                hint: 'Digitel seu nome completo',
                onChanged: (value) => controller.onChange(name: value),
                validator: (valor) =>
                    valor.isNotEmpty ? null : 'Digite seu nome completo.',
              ),
              SizedBox(height: 18),
              InputText(
                label: 'E-mail',
                hint: 'Digitel seu e-mail',
                onChanged: (value) => controller.onChange(email: value),
                validator: (valor) =>
                    isEmail(valor) ? null : 'Digite um e-mail válido.',
              ),
              SizedBox(height: 18),
              InputText(
                label: 'Senha',
                hint: 'Digitel sua senha',
                obscure: true,
                onChanged: (value) => controller.onChange(password: value),
                validator: (valor) => isLength(valor, 6)
                    ? null
                    : 'A senha deve conter no mínimo 6 caracteres.',
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (_, __) => controller.state.when(
                  loading: () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                  orElse: () => Button(
                    label: 'Criar conta',
                    onTap: () {
                      controller.createAccount();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
37 minutos