// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:merlo/app/app.dart';
import 'package:merlo/bootstrap.dart';
import 'package:merlo/core/utils/constants.dart';

void main() {
  bootstrap(() => const App(), environment: Environment.production);
}
