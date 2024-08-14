import 'package:equatable/equatable.dart';
import 'package:travelapp/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class IntialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class SuccesState extends CubitStates {
  SuccesState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailsState extends CubitStates {
  DetailsState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}
