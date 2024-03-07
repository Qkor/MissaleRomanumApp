import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/services/missal_api_service.dart';
import 'package:missale/models/calendar.dart';
import 'package:missale/models/ordo.dart';
import 'nav_event.dart';
import 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState>{
  final MissalApiService service = MissalApiService();
  NavBloc() : super(InitState()){
    on<NavCalendarEvent>(_getCalendar);
    on<NavOrdoEvent>(_getOrdo);
    on<NavProperEvent>(_getProper);
  }

  _getCalendar(NavCalendarEvent event, Emitter<NavState> emit) async {
    emit(LoadingState());
    try{
      List<LiturgicalCalendar> calendar = await service.fetchCurrentYearCalendar();
      emit(CalendarLoadedState(calendar));
    } catch(_){
      emit(FailureState());
    }
  }

  _getOrdo(NavOrdoEvent event, Emitter<NavState> emit) async {
    emit(LoadingState());
    try{
      Ordo ordo = await service.fetchOrdo();
      emit(OrdoLoadedState(ordo));
    } catch(_){
      emit(FailureState());
    }
  }

  _getProper(NavProperEvent event, Emitter<NavState> emit) async {
    emit(LoadingProperState());
    try{
      Ordo ordo = await service.fetchProper(event.id);
      emit(ProperLoadedState(ordo));
    } catch(_){
      emit(FailureState());
    }
  }

}