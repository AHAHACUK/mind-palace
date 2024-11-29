import 'package:mind_palace/features/markdown/ui/entities/markdown_text_update.dart';

abstract class MarkdownFormatter {
  MarkdownTextUpdate apply(MarkdownTextUpdate update);
}
