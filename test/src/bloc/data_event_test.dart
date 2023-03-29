import 'package:flutter_test/flutter_test.dart';
import 'package:interview_application/src/view/bloc/bloc.dart';

void main() {
  group('DataEvent', () {
    test('DataEvent.fetchingStarted supports equality', () {
      expect(
        DataEvent.fetchingStarted(),
        equals(
          DataEvent.fetchingStarted(),
        ),
      );
    });
  });
}
