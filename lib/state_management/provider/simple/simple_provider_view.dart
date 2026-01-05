import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:revision_master/commons/myScaffold.dart';

import 'my_providers.dart';

class SimpleProviderView extends StatefulWidget {
  const SimpleProviderView({super.key});

  @override
  State<SimpleProviderView> createState() => _SimpleProviderViewState();
}

class _SimpleProviderViewState extends State<SimpleProviderView> {
  @override
  Widget build(BuildContext context) {
    final num = context.watch<CounterProvider>();
    return Myscaffold(
      appBarText: "Simple Provider",
      scaffoldBody: Text((num.value).toString()),
      fabText: "Increment",
      fabOnPressed: () {
        context.read<CounterProvider>().increment();
      },
    );
  }
}
