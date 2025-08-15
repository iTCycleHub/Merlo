// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merlo/app/router/app_router.dart';
import 'package:merlo/core/extensions/context_extensions.dart';
import 'package:merlo/core/utils/app_theme.dart';
import 'package:merlo/core/utils/constants.dart';
import 'package:merlo/injector.dart';
import 'package:merlo/l10n/l10n.dart';
import 'package:merlo/shared/flash/presentation/blocs/cubit/flash_cubit.dart';
import 'package:merlo/theme_controller.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    globalThemeController.getThemeState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FlashCubit>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FlashCubit, FlashState>(
            listener: (context, state) {
              switch (state) {
                case FlashDisappeared():
                  break;
                case FlashAppeared():
                  context.showSnackbar(
                    message: state.message,
                  );
              }
            },
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(ScreenUtilSize.width, ScreenUtilSize.height),
          builder: (context, child) {
            return MaterialApp.router(
              scaffoldMessengerKey: rootScaffoldMessengerKey,
              title: 'Merlo - iTCycle',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system, // Usar system por defecto
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: router(),
              builder: (context, widget) {
                return ListenableBuilder(
                  listenable: globalThemeController,
                  builder: (context, child) {
                    return AnimatedTheme(
                      data: globalThemeController.themeMode == ThemeMode.dark
                          ? AppTheme.darkTheme
                          : AppTheme.lightTheme,
                      duration: const Duration(milliseconds: 300),
                      child: MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaler: TextScaler.noScaling),
                        child: widget!,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
