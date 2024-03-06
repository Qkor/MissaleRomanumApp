import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:missale/services/missal_api_service.dart';
import '../models/calendar.dart';
import 'nav_event.dart';
import 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState>{
  final MissalApiService service = MissalApiService();
  NavBloc() : super(CalendarLoadedState()){
    on<NavCalendarEvent>(_getCalendar);
  }

  _getCalendar(NavEvent event, Emitter<NavState> emit) async {
    emit(LoadingState());
    try{
      List<LiturgicalCalendar> calendar = await service.fetchCurrentYearCalendar();
      emit(CalendarLoadedState());
    } catch(_){
      emit(FailureState());
    }
  }

}