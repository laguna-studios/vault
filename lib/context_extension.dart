import "package:flutter/material.dart";

extension ContextExtension on BuildContext {
  Future<T?> go<T>(Widget child) => Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => child));
}
