import 'package:otter/otter.dart' as otter;

void main(List<String> arguments) {
  final flags = arguments.where((element) => element.startsWith('-')).toList();
  final expression = arguments.where((element) => !element.startsWith('-')).toList();
  if (expression.isEmpty) {
    print("Please add an expression as an argument");
    return;
  }
  if (flags.isNotEmpty) {
    print("Flags are not implemented yet");
  }
  print(otter.evaluate(expression.first));
}
