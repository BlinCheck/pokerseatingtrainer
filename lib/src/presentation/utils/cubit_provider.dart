import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokerseatingtrainer/src/presentation/features/dependencies/dependencies_widget.dart';

class CubitProvider<T extends BlocBase<Object?>> extends StatelessWidget {
  const CubitProvider({
    this.child,
    this.onCreate,
    this.lazy = false,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final Function(T)? onCreate;
  final bool lazy;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (context) {
        final getIt = DependenciesWidget.of(context);

        if (!getIt.isRegistered<T>()) {
          throw Exception('Type $T is not marked as injectable');
        }

        final cubit = getIt.get<T>();
        onCreate?.call(cubit);
        return cubit;
      },
      lazy: lazy,
      child: child,
    );
  }
}
