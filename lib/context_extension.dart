import "package:flutter/material.dart";
import "package:provider/provider.dart";

extension ContextExtension on BuildContext {
  Future<T?> goWith<T>(Widget child, {List<ChangeNotifier> changeNotifiers = const []}) => Navigator.of(this).push<T>(
        MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [for (final value in changeNotifiers) ChangeNotifierProvider.value(value: value)],
            child: child,
          ),
        ),
      );

  Future<T?> go<T>(Widget child) => Navigator.of(this).push<T>(
        MaterialPageRoute(
          builder: (_) => child,
        ),
      );
}
