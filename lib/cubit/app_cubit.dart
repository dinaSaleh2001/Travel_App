// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';

import 'package:travelapp/cubit/app_state.dart';
import 'package:travelapp/model/data_model.dart';

import 'package:travelapp/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(IntialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(SuccesState(places));
    } catch (e) {
      print(e);
    }
  }

  detailspage(DataModel data) {
    emit(DetailsState(data));
  }

  gohome() {
    emit(SuccesState(places));
  }
}
