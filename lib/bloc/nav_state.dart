import 'package:equatable/equatable.dart';

abstract class NavState extends Equatable {
  @override
  List<Object> get props => [];
}
class LoadingState extends NavState{}
class FailureState extends NavState{}
class CalendarLoadedState extends NavState{}
class OrdoLoadedState extends NavState{}
