import 'package:equatable/equatable.dart';

abstract class NavEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class StartupEvent extends NavEvent{}
class CalendarEvent extends NavEvent{
  final int year;
  CalendarEvent({required this.year});
}
class OrdoEvent extends NavEvent{}
class MapEvent extends NavEvent{}
class ProperEvent extends NavEvent{
  final String id;
  ProperEvent({required this.id});
}
