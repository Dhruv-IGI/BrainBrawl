class CompetitionModel {
  CompetitionModel({
    this.competitionId,
    this.competition,
    this.time,
    this.roomTime,
    this.level,
    this.leftLevel,
  });

  CompetitionModel.fromJson(dynamic json) {
    competitionId = json['competition_id'];
    competition = json['competition'];
    time = json['time'];
    roomTime = json['room_time'];
    level = json['level'];
    leftLevel = json['left_level'];
  }

  String? competitionId;
  String? competition;
  String? time;
  int? roomTime;
  int? level;
  int? leftLevel;

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['competition_id'] = competitionId;
    data['competition'] = competition;
    data['time'] = time;
    data['room_time'] = roomTime;
    data['level'] = level;
    data['left_level'] = leftLevel;
    return data;
  }
}
