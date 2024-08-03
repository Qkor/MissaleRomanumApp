import 'package:freezed_annotation/freezed_annotation.dart';

part 'liturgical_calendar.freezed.dart';
part 'liturgical_calendar.g.dart';

@freezed
class LiturgicalCalendar with _$LiturgicalCalendar{
  const factory LiturgicalCalendar({
    required String id,
    required String title,
    required int rank,
    required List<String> tags,
    required List<String> colors
  }) = _LiturgicalCalendar;

  factory LiturgicalCalendar.fromJson(Map<String, dynamic> json) => _$LiturgicalCalendarFromJson(json);
}