import 'package:client/toolkit/utils/context_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin ToastMixin<T extends StatefulWidget> on State<T> {
  late final FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void showErrorToast({required String message}) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    final styles = theme.textTheme;
    fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: colors.errorContainer,
        ),
        child: Text(message, style: styles.bodyMedium),
      ),
    );
  }
}
