class Team {
  //team details
  String? teamname;
  String? college;
  String? logo;
  String? poster;
//play details
  String? playname;
  String? synopsis;
  String? playvideo;
//poc detail
  List<Map<String, dynamic>>? poc;
  String? teampic;
  int? randomnumber;
  String? code;

  Team({
    this.teamname,
    this.college,
    this.playname,
    this.synopsis,
    //
    this.teampic,
    this.logo,
    this.poster,
    //
    this.playvideo,
    this.poc,
    this.randomnumber,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamname: json['teamname'],
      college: json['college'],
      logo: json['logo'],
      poster: json['poster'],
      //
      playname: json['playname'],
      synopsis: json['synopsis'],
      playvideo: json['playvideo'],
      //
      poc: json['poc'],
      teampic: json['teampic'],
      randomnumber: json['randonumber'],
    );
  }
}
