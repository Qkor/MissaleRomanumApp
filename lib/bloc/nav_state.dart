import 'package:equatable/equatable.dart';
import 'package:missale/models/liturgical_calendar.dart';
import 'package:missale/models/ordo.dart';
import 'package:missale/models/map_marker.dart';

abstract class NavState extends Equatable {
  @override
  List<Object> get props => [];
}
class InitState extends NavState{}
class AppReadyState extends NavState{
  final List<MapMarker> mapMarkers;
  AppReadyState({required this.mapMarkers});
}
class LoadingState extends NavState{}
class LoadingProperState extends NavState{}
class FailureState extends NavState{}
class MapState extends NavState{}
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
