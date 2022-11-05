import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatter {
  static InputFormatter? _instance;
  static InputFormatter get instance {
    _instance ??= InputFormatter._init();
    return _instance!;
  }

  InputFormatter._init();
  //
  String get _phoneMask => '0(###) ###-##-##';
  String get _timeMask => '##/##/####';
  String get _timeMaskUnderLine => '####-##-##';
  //
  MaskTextInputFormatter get phoneFormatter =>
      MaskTextInputFormatter(mask: _phoneMask, filter: {'#': RegExp(r'[0-9]')});
  MaskTextInputFormatter get timeFormatter =>
      MaskTextInputFormatter(mask: _timeMask, filter: {'#': RegExp(r'[0-9]')});
  MaskTextInputFormatter get timeFormatterUnderLine => MaskTextInputFormatter(
      mask: _timeMaskUnderLine, filter: {'#': RegExp(r'[0-9]')});
}
