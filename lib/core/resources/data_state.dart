abstract class DataState<T, Failure> {
  T? data;
  Failure? error;

  DataState({this.data, this.error});
}

class DataSuccess<T, Failure> extends DataState<T, Failure> {
  DataSuccess({super.data});
}

class DataFailed<T, Failure> extends DataState<T, Failure> {
  DataFailed({super.error});
}
