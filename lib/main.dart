import 'package:flutter/material.dart';
import 'package:revision_master/state_management/provider/simple/my_providers.dart';
import 'package:flutter/foundation.dart';
import 'app.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CounterProvider(), child: MyApp()),
  );
}
