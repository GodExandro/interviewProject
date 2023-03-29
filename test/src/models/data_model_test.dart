import 'package:flutter_test/flutter_test.dart';
import 'package:interview_application/src/domain/domain.dart';

void main() {
  group('DataModelTest', () {
    test('can be initialized', () {
      const dataModel = DataModel(
        title: 'test',
        description: 'test',
        image_url:
            'https://fastly.picsum.photos/id/858/200/300.jpg?hmac=DTAlvvjtwmfGDoOk7DeD1M6RbbwgALztKa3o8V8TF7s',
        modificationDate: '25-05-1995',
        orderId: 0,
      );
      expect(dataModel, isNotNull);
    });

    test('supports value equality', () {
      const dataModel1 = DataModel(
        title: 'test2',
        description: 'test2',
        image_url:
            'https://fastly.picsum.photos/id/858/200/300.jpg?hmac=DTAlvvjtwmfGDoOk7DeD1M6RbbwgALztKa3o8V8TF7s',
        modificationDate: '25-05-1996',
        orderId: 1,
      );

      const dataModel2 = DataModel(
        title: 'test2',
        description: 'test2',
        image_url:
            'https://fastly.picsum.photos/id/858/200/300.jpg?hmac=DTAlvvjtwmfGDoOk7DeD1M6RbbwgALztKa3o8V8TF7s',
        modificationDate: '25-05-1996',
        orderId: 1,
      );

      expect(dataModel1, equals(dataModel2));
    });
  });
}
