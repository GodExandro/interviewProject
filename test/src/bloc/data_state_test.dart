import 'package:flutter_test/flutter_test.dart';
import 'package:interview_application/src/view/bloc/bloc.dart';

void main() {
  group('DataState', () {
    test('supports value equality', () {
      expect(
        DataState(status: DataStatus.initial),
        equals(DataState(status: DataStatus.initial)),
      );
    });
    test('returns same object when no properties are passed', () {
      expect(
        DataState(status: DataStatus.initial).copyWith(),
        DataState(status: DataStatus.initial),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        DataState(status: DataStatus.initial)
            .copyWith(status: DataStatus.success),
        DataState(status: DataStatus.success),
      );
    });
  });
}
