import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_palace/features/markdown/ui/entities/text_edit.dart';

void main() {
  group('TextEdit parse', () {
    test(
      'result should be correct when add one letter',
      () {
        const oldValue = TextEditingValue(
          text: 'My name: ',
          selection: TextSelection.collapsed(
            offset: 9,
          ),
        );
        const newValue = TextEditingValue(
          text: 'My name: B',
          selection: TextSelection.collapsed(
            offset: 10,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 9);
        expect(textEdit?.inserted, 'B');
        expect(textEdit?.deleted, '');
      },
    );

    test(
      'result should be correct when insert one letter',
      () {
        const oldValue = TextEditingValue(
          text: 'My name: Bob',
          selection: TextSelection.collapsed(
            offset: 10,
          ),
        );
        const newValue = TextEditingValue(
          text: 'My name: Blob',
          selection: TextSelection.collapsed(
            offset: 11,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 10);
        expect(textEdit?.inserted, 'l');
        expect(textEdit?.deleted, '');
      },
    );

    test(
      'result should be correct when replace one letter',
      () {
        const oldValue = TextEditingValue(
          text: 'My name: Bob',
          selection: TextSelection(
            baseOffset: 10,
            extentOffset: 11,
          ),
        );
        const newValue = TextEditingValue(
          text: 'My name: Bub',
          selection: TextSelection.collapsed(
            offset: 11,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 10);
        expect(textEdit?.inserted, 'u');
        expect(textEdit?.deleted, 'o');
      },
    );

    test(
      'result should be correct when replace one letter with reversed selection',
      () {
        const oldValue = TextEditingValue(
          text: 'My name: Bob',
          selection: TextSelection(
            baseOffset: 11,
            extentOffset: 10,
          ),
        );
        const newValue = TextEditingValue(
          text: 'My name: Bub',
          selection: TextSelection.collapsed(
            offset: 11,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 10);
        expect(textEdit?.inserted, 'u');
        expect(textEdit?.deleted, 'o');
      },
    );

    test(
      'result should be correct when replace multiple letters',
      () {
        const oldValue = TextEditingValue(
          text: 'My name: Bob',
          selection: TextSelection(
            baseOffset: 9,
            extentOffset: 12,
          ),
        );
        const newValue = TextEditingValue(
          text: 'My name: Tom',
          selection: TextSelection.collapsed(
            offset: 12,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 9);
        expect(textEdit?.inserted, 'Tom');
        expect(textEdit?.deleted, 'Bob');
      },
    );

    test(
      'result should be correct when replace whole string',
      () {
        const oldValue = TextEditingValue(
          text: 'My name: Bob',
          selection: TextSelection(
            baseOffset: 0,
            extentOffset: 12,
          ),
        );
        const newValue = TextEditingValue(
          text: 'Forget that',
          selection: TextSelection.collapsed(
            offset: 11,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 0);
        expect(textEdit?.inserted, 'Forget that');
        expect(textEdit?.deleted, 'My name: Bob');
      },
    );

    test(
      'result should be correct when add whole string',
      () {
        const oldValue = TextEditingValue(
          text: '',
          selection: TextSelection.collapsed(
            offset: 0,
          ),
        );
        const newValue = TextEditingValue(
          text: 'Copy pasted whole page lol',
          selection: TextSelection.collapsed(
            offset: 26,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 0);
        expect(textEdit?.inserted, 'Copy pasted whole page lol');
        expect(textEdit?.deleted, '');
      },
    );

    test(
      'result should be correct when delete with backspace key',
      () {
        const oldValue = TextEditingValue(
          text: 'My name: Bob',
          selection: TextSelection.collapsed(
            offset: 12,
          ),
        );
        const newValue = TextEditingValue(
          text: 'My name: ',
          selection: TextSelection.collapsed(
            offset: 9,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 9);
        expect(textEdit?.inserted, '');
        expect(textEdit?.deleted, 'Bob');
      },
    );

    test(
      'result should be correct when delete with delete key',
      () {
        const oldValue = TextEditingValue(
          text: 'My name: Bob',
          selection: TextSelection.collapsed(
            offset: 9,
          ),
        );
        const newValue = TextEditingValue(
          text: 'My name: ',
          selection: TextSelection.collapsed(
            offset: 9,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit?.index, 9);
        expect(textEdit?.inserted, '');
        expect(textEdit?.deleted, 'Bob');
      },
    );

    test(
      'result should be null if no changed made',
      () {
        const oldValue = TextEditingValue(
          text: 'Text',
          selection: TextSelection.collapsed(
            offset: 0,
          ),
        );
        const newValue = TextEditingValue(
          text: 'Text',
          selection: TextSelection.collapsed(
            offset: 1,
          ),
        );
        final textEdit = TextEdit.fromTextEditingValues(
          oldValue,
          newValue,
        );
        expect(textEdit, isNull);
      },
    );
  });
}
