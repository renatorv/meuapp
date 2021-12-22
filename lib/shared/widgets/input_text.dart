import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;

  const InputText({
    required this.label,
    required this.hint,
    Key? key, this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(height: 12),
        TextFormField(
          obscureText: obscure,
          style: AppTheme.textStyles.input,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTheme.textStyles.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppTheme.colors.border,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
