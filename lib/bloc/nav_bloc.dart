import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/managers/map_manager.dart';
import 'package:missale/services/missal_api_service.dart';
import 'package:missale/models/liturgical_calendar.dart';
import 'package:missale/models/ordo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:missale/managers/database_manager.dart';
import 'nav_event.dart';
import 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState>{
  late MissalApiService service;
  late Database database;

  NavBloc() : super(InitState()){
    on<StartupEvent>(_serviceSetup);
    on<CalendarEvent>(_getCalendar);
    on<OrdoEvent>(_getOrdo);
    on<ProperEvent>(_getProper);
    on<MapEvent>(_mapPage);
  }

  _serviceSetup(StartupEvent event, Emitter<NavState> emit) async {
    emit(LoadingState());
    final databaseManager = DatabaseManager();
    await databaseManager.initializeDatabase();
    await MapManager.loadMapMarkers();
    service = MissalApiService(databaseManager);
    emit(AppReadyState());
  }

  _getCalendar(CalendarEvent event, Emitter<NavState> emit) async {
    emit(LoadingState());
    try{
      List<LiturgicalCalendar> calendar = await service.fetchCalendar(event.year);
      emit(CalendarLoadedState(calendar, event.year, event.scrollToToday));
    } catch(_){
      emit(FailureState());
    }
  }

  _getOrdo(OrdoEvent event, Emitter<NavState> emit) async {
    emit(LoadingState());
    try{
      Ordo ordo = await service.fetchOrdo();
      emit(OrdoLoadedState(ordo));
    } catch(_){
      emit(FailureState());
    }
  }

  _getProper(ProperEvent event, Emitter<NavState> emit) async {
    emit(LoadingProperState());
    try{
      Ordo ordo = await service.fetchProper(event.id);
      emit(ProperLoadedState(ordo));
    } catch(_){
      emit(FailureState());
    }
  }

  _mapPage(MapEvent event, Emitter<NavState> emit){
    emit(MapState());
  }

}