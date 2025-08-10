// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:merlo/core/utils/constants.dart';
import 'package:merlo/injector.dart';

Future<void> configureInjector() async {
  await configureDependencies(environment: Environment.test);
}
