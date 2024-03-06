class OrdoInfo{
  final String title;

  OrdoInfo(this.title);

  factory OrdoInfo.fromJson(Map<String, dynamic> json){
    return OrdoInfo(
      json['title']
    );
  }
}

class OrdoSection{
  final String id;
  final String label;
  final List<List<String>> body;

  OrdoSection(this.id, this.label, this.body);

  factory OrdoSection.fromJson(Map<String, dynamic> json){

    return OrdoSection(
      json['id'],
      json['label'],
      List<List<String>>.from((json['body'] as List<dynamic>).map((item) => List<String>.from(item as List<dynamic>)))
    );
  }
}

class Ordo{
  final OrdoInfo info;
  final List<OrdoSection> sections;

  Ordo(this.info, this.sections);

  factory Ordo.fromJson(Map<String, dynamic> json){
    return Ordo(
      OrdoInfo.fromJson(json['info']),
      List<OrdoSection>.from((json['sections']).map(((data) => OrdoSection.fromJson(data))).toList())
    );
  }
}