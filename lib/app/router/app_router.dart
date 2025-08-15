// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:merlo/features/counter/counter.dart';
import 'package:merlo/features/home/home.dart';
import 'package:merlo/shared/layout/main_layout.dart';

class AppRouter extends Equatable {
  static const home = 'home';
  static const counter = 'counter';

  @override
  List<Object?> get props => [home, counter];
}

GoRouter router([String? initialLocation]) => GoRouter(
      debugLogDiagnostics: kDebugMode || kProfileMode,
      initialLocation: initialLocation ?? '/',
      routes: [
        GoRoute(
          path: '/',
          name: AppRouter.home,
          builder: (context, state) => const MainLayout(child: HomePage()),
        ),
        GoRoute(
          path: '/counter',
          name: AppRouter.counter,
          builder: (context, state) => const MainLayout(child: CounterPage()),
        ),
      ],
    );
