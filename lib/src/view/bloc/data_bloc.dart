import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_application/src/domain/domain.dart';
import 'package:interview_application/src/services/services.dart';

part 'data_bloc.freezed.dart';

@freezed
class DataEvent with _$DataEvent {
  factory DataEvent.fetchingStarted() = _FetchingStarted;

  DataEvent._();
}

enum DataStatus {
  initial,
  isLoading,
  success,
  loadingFailed,
}

@freezed
class DataState with _$DataState {
  factory DataState({
    required DataStatus status,
    List<DataModel>? data,
  }) = _DataState;
}

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc(this.dataService) : super(DataState(status: DataStatus.initial)) {
    on<_FetchingStarted>(_getData);
  }
  final DataService dataService;
  Future<void> _getData(
    _FetchingStarted events,
    Emitter<DataState> emit,
  ) async {
    emit(DataState(status: DataStatus.isLoading));

    try {
      emit(DataState(status: DataStatus.isLoading));

      final dataList = await dataService.fetchData();

      dataList.sort((a, b) => a.orderId.compareTo(b.orderId));

      emit(state.copyWith(status: DataStatus.success, data: dataList));
    } catch (e, st) {
      emit(DataState(status: DataStatus.loadingFailed));
      addError(e, st);
    }
  }
}
