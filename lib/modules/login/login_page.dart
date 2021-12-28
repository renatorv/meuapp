import 'package:flutter/material.dart';
import 'package:meuapp/modules/login/login_controller.dart';
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
  final controller = LoginController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.addListener(
      () {
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
          // loading: () => print('Loading...'),
          orElse: () {},
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 200),
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
                  loading: () => Padding(
                    padding: const EdgeInsets.all(12),
                    child: CircularProgressIndicator(),
                  ),
                  orElse: () => Column(
                    children: [
                      Button(
                        label: 'Entrar',
                        onTap: () {
                          controller.login();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
