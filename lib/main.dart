// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:merlo/bootstrap.dart';
import 'package:merlo/core/utils/constants.dart';
import 'app/app.dart';

void main() {
  bootstrap(() => const App(), environment: Environment.development);
}
