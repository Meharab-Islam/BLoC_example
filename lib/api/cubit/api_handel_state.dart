part of 'api_handel_cubit.dart';

@immutable
abstract class ApiHandelState {}

class ApiHandelLoadingState extends ApiHandelState {}

class ApiHandelLoadedState extends ApiHandelState {
  final List<ApiModel> apiData;
  ApiHandelLoadedState(this.apiData);
}

class ApiHandelErrorState extends ApiHandelState {
  final String error;
  ApiHandelErrorState(this.error);
}
