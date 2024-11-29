import 'package:mind_palace/features/markdown/ui/entities/markdown_effect.dart';

class MarkdownTextEntry {
  final int codeUnit;
  final Set<MarkdownEffect> effects;

  const MarkdownTextEntry({
    required this.codeUnit,
    required this.effects,
  });
}
