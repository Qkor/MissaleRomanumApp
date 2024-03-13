import 'package:equatable/equatable.dart';
import 'package:missale/models/calendar.dart';
import 'package:missale/models/ordo.dart';

abstract class NavState extends Equatable {
  @override
  List<Object> get props => [];
}
class InitState extends NavState{}
class AppReadyState extends NavState{}
class LoadingState extends NavState{}
class LoadingProperState extends NavState{}
class FailureState extends NavState{}
class CalendarLoadedState extends NavState{
  final List<LiturgicalCalendar> calendar;
  CalendarLoadedState(this.calendar);
}
class OrdoLoadedState extends NavState{
  final Ordo ordo;
  OrdoLoadedState(this.ordo);
}
class ProperLoadedState extends NavState{
  final Ordo proper;
  ProperLoadedState(this.proper);
}
