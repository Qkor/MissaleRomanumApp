import 'package:freezed_annotation/freezed_annotation.dart';

part 'ordo_info.freezed.dart';
part 'ordo_info.g.dart';

@freezed
class OrdoInfo with _$OrdoInfo{
  const factory OrdoInfo({
    required String title
  }) = _OrdoInfo;
  factory OrdoInfo.fromJson(Map<String, dynamic> json) => _$OrdoInfoFromJson(json);
}
