import 'package:equatable/equatable.dart';

import '../models/calendar.dart';

abstract class NavState extends Equatable {
  @override
  List<Object> get props => [];
}
class InitState extends NavState{}
class LoadingState extends NavState{}
class FailureState extends NavState{}
class CalendarLoadedState extends NavState{
  final List<LiturgicalCalendar> calendar;
  CalendarLoadedState(this.calendar);
}
class OrdoLoadedState extends NavState{}
