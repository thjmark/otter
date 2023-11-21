class ParsingError implements Exception {
  ParsingError(this.message);
  final String message;

  @override
  String toString() {
    return 'ParsingError{message: $message}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ParsingError && runtimeType == other.runtimeType && message == other.message;

  @override
  int get hashCode => message.hashCode;
}