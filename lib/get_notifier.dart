import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nested/nested.dart';
import 'package:flutter/services.dart';
export 'package:get_it/get_it.dart';

class GetNotifier {
  static const MethodChannel _channel = MethodChannel('get_notifier');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

// Singe model worker
class Worker<A extends Object> extends SingleChildStatelessWidget {
  Worker({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    Widget? child,
  ) builder;

  final a = GetIt.I.get<A>();

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return builder(
      a,
      child,
    );
  }
}

// Two models worker
class Worker2<A extends Object, B extends Object> extends SingleChildStatelessWidget {
  Worker2({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    Widget? child,
  ) builder;

  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return builder(
      a,
      b,
      child,
    );
  }
}

// Tree models worker
class Worker3<A extends Object, B extends Object, C extends Object> extends SingleChildStatelessWidget {
  Worker3({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    C value3,
    Widget? child,
  ) builder;

  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();
  final c = GetIt.I.get<C>();

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return builder(
      a,
      b,
      c,
      child,
    );
  }
}

class Worker4<A extends Object, B extends Object, C extends Object, D extends Object>
    extends SingleChildStatelessWidget {
  Worker4({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    C value3,
    D value4,
    Widget? child,
  ) builder;

  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();
  final c = GetIt.I.get<C>();
  final d = GetIt.I.get<D>();

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return builder(
      a,
      b,
      c,
      d,
      child,
    );
  }
}

// Five models worker
class Worker5<A extends Object, B extends Object, C extends Object, D extends Object, E extends Object>
    extends SingleChildStatelessWidget {
  Worker5({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    C value3,
    D value4,
    E value5,
    Widget? child,
  ) builder;

  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();
  final c = GetIt.I.get<C>();
  final d = GetIt.I.get<D>();
  final e = GetIt.I.get<E>();

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return builder(
      a,
      b,
      c,
      d,
      e,
      child,
    );
  }
}

// Six models worker
class Worker6<A extends Object, B extends Object, C extends Object, D extends Object, E extends Object,
    F extends Object> extends SingleChildStatelessWidget {
  Worker6({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    C value3,
    D value4,
    E value5,
    F value6,
    Widget? child,
  ) builder;

  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();
  final c = GetIt.I.get<C>();
  final d = GetIt.I.get<D>();
  final e = GetIt.I.get<E>();
  final f = GetIt.I.get<F>();

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return builder(
      a,
      b,
      c,
      d,
      e,
      f,
      child,
    );
  }
}

// Singe model consumer
class Consumer<A extends Object> extends SingleChildStatefulWidget {
  const Consumer({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    Widget? child,
  ) builder;

  @override
  ConsumerState<A> createState() {
    return ConsumerState<A>();
  }
}

// 2 models consumer
class ConsumerState<A extends Object> extends SingleChildState<Consumer<A>> {
  void update() => setState(() => {});
  final a = GetIt.I.get<A>();
  @override
  void initState() {
    if (a is ChangeNotifier) (a as ChangeNotifier).addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    if (a is ChangeNotifier) (a as ChangeNotifier).removeListener(update);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return widget.builder(
      a,
      child,
    );
  }
}

// 3 models consumer
class Consumer2<A extends Object, B extends Object> extends SingleChildStatefulWidget {
  const Consumer2({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    Widget? child,
  ) builder;

  @override
  Consumer2State<A, B> createState() {
    return Consumer2State<A, B>();
  }
}

class Consumer2State<A extends Object, B extends Object> extends SingleChildState<Consumer2<A, B>> {
  void update() => setState(() => {});
  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();

  @override
  void initState() {
    if (a is ChangeNotifier) (a as ChangeNotifier).addListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    if (a is ChangeNotifier) (a as ChangeNotifier).removeListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).removeListener(update);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return widget.builder(
      a,
      b,
      child,
    );
  }
}

// 3 models consumer
class Consumer3<A extends Object, B extends Object, C extends Object> extends SingleChildStatefulWidget {
  const Consumer3({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    C value3,
    Widget? child,
  ) builder;

  @override
  Consumer3State<A, B, C> createState() {
    return Consumer3State<A, B, C>();
  }
}

class Consumer3State<A extends Object, B extends Object, C extends Object>
    extends SingleChildState<Consumer3<A, B, C>> {
  void update() => setState(() => {});
  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();
  final c = GetIt.I.get<C>();

  @override
  void initState() {
    if (a is ChangeNotifier) (a as ChangeNotifier).addListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).addListener(update);
    if (c is ChangeNotifier) (c as ChangeNotifier).addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    if (a is ChangeNotifier) (a as ChangeNotifier).removeListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).removeListener(update);
    if (c is ChangeNotifier) (c as ChangeNotifier).removeListener(update);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return widget.builder(
      a,
      b,
      c,
      child,
    );
  }
}

// 4 models consumer
class Consumer4<A extends Object, B extends Object, C extends Object, D extends Object>
    extends SingleChildStatefulWidget {
  const Consumer4({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    C value3,
    D value4,
    Widget? child,
  ) builder;

  @override
  Consumer4State<A, B, C, D> createState() {
    return Consumer4State<A, B, C, D>();
  }
}

class Consumer4State<A extends Object, B extends Object, C extends Object, D extends Object>
    extends SingleChildState<Consumer4<A, B, C, D>> {
  void update() => setState(() => {});
  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();
  final c = GetIt.I.get<C>();
  final d = GetIt.I.get<D>();

  @override
  void initState() {
    if (a is ChangeNotifier) (a as ChangeNotifier).addListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).addListener(update);
    if (c is ChangeNotifier) (c as ChangeNotifier).addListener(update);
    if (d is ChangeNotifier) (d as ChangeNotifier).addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    if (a is ChangeNotifier) (a as ChangeNotifier).removeListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).removeListener(update);
    if (c is ChangeNotifier) (c as ChangeNotifier).removeListener(update);
    if (d is ChangeNotifier) (d as ChangeNotifier).removeListener(update);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return widget.builder(
      a,
      b,
      c,
      d,
      child,
    );
  }
}

// 5 models consumer
class Consumer5<A extends Object, B extends Object, C extends Object, D extends Object, E extends Object>
    extends SingleChildStatefulWidget {
  const Consumer5({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    C value3,
    D value4,
    E value5,
    Widget? child,
  ) builder;

  @override
  Consumer5State<A, B, C, D, E> createState() {
    return Consumer5State<A, B, C, D, E>();
  }
}

class Consumer5State<A extends Object, B extends Object, C extends Object, D extends Object, E extends Object>
    extends SingleChildState<Consumer5<A, B, C, D, E>> {
  void update() => setState(() => {});
  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();
  final c = GetIt.I.get<C>();
  final d = GetIt.I.get<D>();
  final e = GetIt.I.get<E>();

  @override
  void initState() {
    if (a is ChangeNotifier) (a as ChangeNotifier).addListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).addListener(update);
    if (c is ChangeNotifier) (c as ChangeNotifier).addListener(update);
    if (d is ChangeNotifier) (d as ChangeNotifier).addListener(update);
    if (e is ChangeNotifier) (e as ChangeNotifier).addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    if (a is ChangeNotifier) (a as ChangeNotifier).removeListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).removeListener(update);
    if (c is ChangeNotifier) (c as ChangeNotifier).removeListener(update);
    if (d is ChangeNotifier) (d as ChangeNotifier).removeListener(update);
    if (e is ChangeNotifier) (e as ChangeNotifier).removeListener(update);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return widget.builder(
      a,
      b,
      c,
      d,
      e,
      child,
    );
  }
}

// 6 models consumer
class Consumer6<A extends Object, B extends Object, C extends Object, D extends Object, E extends Object,
    F extends Object> extends SingleChildStatefulWidget {
  const Consumer6({
    Key? key,
    required this.builder,
    Widget? child,
  }) : super(key: key, child: child);

  final Widget Function(
    A value,
    B value2,
    C value3,
    D value4,
    E value5,
    F value6,
    Widget? child,
  ) builder;

  @override
  Consumer6State<A, B, C, D, E, F> createState() {
    return Consumer6State<A, B, C, D, E, F>();
  }
}

class Consumer6State<A extends Object, B extends Object, C extends Object, D extends Object, E extends Object,
    F extends Object> extends SingleChildState<Consumer6<A, B, C, D, E, F>> {
  void update() => setState(() => {});
  final a = GetIt.I.get<A>();
  final b = GetIt.I.get<B>();
  final c = GetIt.I.get<C>();
  final d = GetIt.I.get<D>();
  final e = GetIt.I.get<E>();
  final f = GetIt.I.get<F>();

  @override
  void initState() {
    if (a is ChangeNotifier) (a as ChangeNotifier).addListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).addListener(update);
    if (c is ChangeNotifier) (c as ChangeNotifier).addListener(update);
    if (d is ChangeNotifier) (d as ChangeNotifier).addListener(update);
    if (e is ChangeNotifier) (e as ChangeNotifier).addListener(update);
    if (f is ChangeNotifier) (f as ChangeNotifier).addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    if (a is ChangeNotifier) (a as ChangeNotifier).removeListener(update);
    if (b is ChangeNotifier) (b as ChangeNotifier).removeListener(update);
    if (c is ChangeNotifier) (c as ChangeNotifier).removeListener(update);
    if (d is ChangeNotifier) (d as ChangeNotifier).removeListener(update);
    if (e is ChangeNotifier) (e as ChangeNotifier).removeListener(update);
    if (f is ChangeNotifier) (f as ChangeNotifier).removeListener(update);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return widget.builder(
      a,
      b,
      c,
      d,
      e,
      f,
      child,
    );
  }
}
