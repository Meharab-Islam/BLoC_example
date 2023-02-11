import 'package:bloc_practice/api/apiModel.dart';
import 'package:bloc_practice/api/api_list_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'api_handel_state.dart';

class ApiHandelCubit extends Cubit<ApiHandelState> {
  ApiHandelCubit() : super(ApiHandelLoadingState()){
    getNews();
  }

  ApiResponse data = ApiResponse();

  void getNews() async {
    try {
      List<ApiModel> news = await data.fetchData();
      emit(ApiHandelLoadedState(news));
    } catch (e) {
      emit(ApiHandelErrorState(e.toString()));
    }
  }
}
