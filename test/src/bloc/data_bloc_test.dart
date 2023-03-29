import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interview_application/src/domain/domain.dart';
import 'package:interview_application/src/services/services.dart';
import 'package:interview_application/src/view/bloc/bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockDataService extends Mock implements DataService {}

class MockDataModel extends Mock implements DataModel {}

void main() {
  group('DataBloc', () {
    late DataModel testDataModel;
    late DataService dataService;
    setUp(() {
      testDataModel = MockDataModel();
      dataService = MockDataService();
      when(() => dataService.fetchData())
          .thenAnswer((_) => Future(() => [testDataModel]));
    });

    test('has initial state initial', () {
      expect(
        DataBloc(dataService).state,
        DataState(status: DataStatus.initial),
      );
    });

    blocTest<DataBloc, DataState>(
      'emits isLoading on DataEvent.fetchingStarted()',
      build: () => DataBloc(dataService),
      act: (bloc) => bloc.add(DataEvent.fetchingStarted()),
      expect: () => <DataState>[
        DataState(status: DataStatus.isLoading),
        DataState(
          status: DataStatus.success,
          data: [testDataModel],
        ),
      ],
    );
    blocTest<DataBloc, DataState>(
      'starts downloading on DataEvent.fetchingStarted()',
      build: () => DataBloc(dataService),
      act: (bloc) => bloc.add(DataEvent.fetchingStarted()),
      verify: (_) {
        verify(() => dataService.fetchData()).called(1);
      },
    );
  });
}
