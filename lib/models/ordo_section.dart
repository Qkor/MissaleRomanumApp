import 'package:freezed_annotation/freezed_annotation.dart';

part 'ordo_section.freezed.dart';
part 'ordo_section.g.dart';

@freezed
class OrdoSection with _$OrdoSection{
  const factory OrdoSection({
    required String id,
    required String label,
    required List<List<String>> body
  }) = _OrdoSection;

  factory OrdoSection.fromJson(Map<String, dynamic> json) => _$OrdoSectionFromJson(json);
}
