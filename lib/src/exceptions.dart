class UsageError extends Error {
  final String message;

  UsageError(this.message);

  @override
  String toString() => 'UsageError: $message';
}
