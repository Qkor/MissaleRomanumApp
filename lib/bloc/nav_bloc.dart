import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/services/missal_api_service.dart';
import 'package:missale/models/calendar.dart';
import 'package:missale/models/ordo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
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
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'missale.db');
    database = await openDatabase(
      path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE rubrics (id TEXT PRIMARY KEY, json TEXT)');
      }
    );
    service = MissalApiService(database: database);
    emit(AppReadyState());
  }

  _getCalendar(CalendarEvent event, Emitter<NavState> emit) async {
    emit(LoadingState());
    try{
      List<LiturgicalCalendar> calendar = await service.fetchCalendar(event.year);
      emit(CalendarLoadedState(calendar));
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