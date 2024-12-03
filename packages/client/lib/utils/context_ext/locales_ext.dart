import 'package:flutter/cupertino.dart';
import 'package:mind_palace_client/app_localization.dart';

extension AppLocalizationsContext on BuildContext {
  AppLocalizations get locale {
    return AppLocalizations.of(this)!;
  }
}
