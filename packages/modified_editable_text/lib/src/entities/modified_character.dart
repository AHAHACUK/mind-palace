import 'package:modified_editable_text/src/interfaces/text_effect.dart';

class ModifiedCharacter {
  final int codeUnit;
  final Set<TextEffect> effects;

  const ModifiedCharacter({
    required this.codeUnit,
    required this.effects,
  });

  static List<ModifiedCharacter> listFromString(String string) {
    final List<ModifiedCharacter> entries = [];
    final codeUnits = string.codeUnits;
    for (final codeUnit in codeUnits) {
      entries.add(
        ModifiedCharacter(
          codeUnit: codeUnit,
          effects: {},
        ),
      );
    }
    return entries;
  }
}
