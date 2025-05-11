import 'package:client/l10n/output/app_localizations.dart';
import 'package:client/router/app_router.dart';
import 'package:client/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext _) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder:
          (context, _) => MaterialApp.router(
            theme: buildTheme(context),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [Locale('en'), Locale('ru')],
            routerConfig: appRouter,
            builder: FToastBuilder(),
          ),
    );
  }
}
