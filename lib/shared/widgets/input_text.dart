import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;

  const InputText({
    required this.label,
    required this.hint,
    Key? key, this.obscure = false, 
    this.onChanged, 
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(height: 12),
        TextFormField(
          // aula 3 38 minutos
          validator: (value){
            if(validator != null){
              return validator!(value ?? "");
            }
          },
          onChanged: onChanged,
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
