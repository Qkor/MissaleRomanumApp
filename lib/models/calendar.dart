class LiturgicalCalendar{
  final String id;
  final String title;
  final int rank;
  final List<String> tags;
  final List<String> colors;

  const LiturgicalCalendar(this.id, this.title, this.rank, this.tags, this.colors);

  factory LiturgicalCalendar.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'id': String id,
        'title': String title,
        'rank': int rank,
        'tags': dynamic tags,
        'colors': dynamic colors,
      } => LiturgicalCalendar(id, title, rank, List<String>.from(tags), List<String>.from(colors)),
      _ => throw FormatException(json.toString()),
    };
  }
}