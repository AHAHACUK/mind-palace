import 'package:flutter/foundation.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text_entry.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_formatter.dart';
import 'package:mind_palace/features/markdown/ui/entities/markdown_text_update.dart';

/// Applies formatting to portion of the text that is wrapped by [leftWrapperRegex] and [rightWrapperRegex]
///
/// For example, if wrapper is '**', then the formatting would be applied to string 'this **text** is wrapped'.
///
/// The result string would be 'this text is wrapped' and 'text' will be passed ti [applyToWrapped]
abstract class WrapperFormatter implements MarkdownFormatter {
  const WrapperFormatter();

  @protected
  void applyToWrapped(List<MarkdownTextEntry> entries);

  @protected
  String get leftWrapperRegex;
  String get rightWrapperRegex;

  @override
  MarkdownTextUpdate apply(MarkdownTextUpdate update) {
    final text = update.newText;
    final regex = RegExp('($leftWrapperRegex)(.+?)($rightWrapperRegex)');
    final matches = regex.allMatches(text);
    if (matches.isEmpty) {
      return update;
    }
    final newSelection = update.newSelection;
    var newSelectionBase = newSelection.baseOffset;
    var newSelectionExtent = newSelection.extentOffset;
    final newEntries = List.of(update.newEntries);
    for (final match in matches) {
      final matchStart = match.start;
      final matchEnd = match.end;
      final leftWrapperText = match.group(1);
      final leftWrapperLength = leftWrapperText!.length;
      final rightWrapperText = match.group(3);
      final rightWrapperLength = rightWrapperText!.length;
      final affectedEntries = newEntries.sublist(
        matchStart + leftWrapperLength,
        matchEnd - rightWrapperLength,
      );
      if (newSelection.baseOffset > matchStart) {
        newSelectionBase -= leftWrapperLength;
      }
      if (newSelection.baseOffset >= matchEnd) {
        newSelectionBase -= rightWrapperLength;
      }
      if (newSelection.extentOffset > matchStart) {
        newSelectionExtent -= leftWrapperLength;
      }
      if (newSelection.extentOffset >= matchEnd) {
        newSelectionExtent -= rightWrapperLength;
      }
      applyToWrapped(affectedEntries);
      newEntries.removeRange(matchEnd - rightWrapperLength, matchEnd);
      newEntries.removeRange(matchStart, matchStart + leftWrapperLength);
    }
    return update.copyWith(
      newEntries: newEntries,
      newSelection: newSelection.copyWith(
        baseOffset: newSelectionBase,
        extentOffset: newSelectionExtent,
      ),
    );
  }
}
