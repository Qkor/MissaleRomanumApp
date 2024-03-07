import 'package:equatable/equatable.dart';

abstract class NavEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class NavCalendarEvent extends NavEvent{}
class NavOrdoEvent extends NavEvent{}
class NavProperEvent extends NavEvent{
  final String id;
  NavProperEvent({required this.id});
}
