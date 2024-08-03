import 'package:freezed_annotation/freezed_annotation.dart';
import 'ordo_info.dart';
import 'ordo_section.dart';

part 'ordo.freezed.dart';
part 'ordo.g.dart';

@freezed
class Ordo with _$Ordo{
  const factory Ordo({
    required OrdoInfo info,
    required List<OrdoSection> sections
  }) = _Ordo;

  factory Ordo.fromJson(Map<String, dynamic> json) => _$OrdoFromJson(json);
}