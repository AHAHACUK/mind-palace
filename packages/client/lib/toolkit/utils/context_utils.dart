import 'package:client/l10n/output/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
}
