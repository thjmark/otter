import 'package:otter/otter.dart' as otter;

import 'help_text.dart';

void main(List<String> arguments) {
  final flags = arguments.where((element) => element.startsWith('-')).toList();
  final expression = arguments.where((element) => !element.startsWith('-')).toList();
  if(flags.contains("-h")){
    print(HelpText.text);
    return;
  }
  if (expression.isEmpty) {
    print("Please add an expression as an argument");
    return;
  }
  if (flags.isNotEmpty) {
    print(otter.evaluate(expression.first, flags: flags));
  }
  print(otter.evaluate(expression.first));
}
