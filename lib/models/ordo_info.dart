import 'package:freezed_annotation/freezed_annotation.dart';

part 'ordo_info.freezed.dart';
part 'ordo_info.g.dart';

@freezed
class OrdoInfo with _$OrdoInfo{
  const factory OrdoInfo({
    required String title,
    String? description,
    String? tempora,
    String? date,
    String? id,
    List<String>? colors,
    List<String>? tags,
    int? rank,
  }) = _OrdoInfo;
  factory OrdoInfo.fromJson(Map<String, dynamic> json) => _$OrdoInfoFromJson(json);
}
