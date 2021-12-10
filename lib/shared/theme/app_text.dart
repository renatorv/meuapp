import 'package:flutter/material.dart';

import 'app_theme.dart';

class TextExtention {}

extension TextExt on Text {
  Text get label => Text(
        this.data!,
        style: AppTheme.textStyles.label,
      );
}
