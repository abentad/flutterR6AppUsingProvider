class PlayerInfo {
  String playerName;
  String plRankedKd;
  String plRankedDeaths;
  String plRankedKills;
  String plRankedMatches;
  String plRankedWins;
  String plRankedLosses;
  String plRankText;
  String plThisSeasonRankedMmr;
  String plThisSeasonRankedKd;
  String plProfilePic;
  String plRankPic;
  String plTotalPlayTime;
  String plTotalMatchesPlayed;
  String plTotalWins;
  String plTotalLosses;
  String plTotalKills;
  String plTotalDeaths;
  String plTotalKD;
  String plRankedPlayTime;
  String plCasualPlayTime;
  String plTotalKillAssists;
  String plTotalRevives;

  PlayerInfo({
    this.playerName,
    this.plRankedKd,
    this.plRankedDeaths,
    this.plRankedKills,
    this.plRankedMatches,
    this.plRankedWins,
    this.plRankedLosses,
    this.plRankText,
    this.plThisSeasonRankedMmr,
    this.plThisSeasonRankedKd,
    this.plProfilePic,
    this.plRankPic,
    this.plTotalPlayTime,
    this.plTotalMatchesPlayed,
    this.plTotalWins,
    this.plTotalLosses,
    this.plTotalKills,
    this.plTotalDeaths,
    this.plTotalKD,
    this.plRankedPlayTime,
    this.plCasualPlayTime,
    this.plTotalKillAssists,
    this.plTotalRevives,
  });

  PlayerInfo.fromJson(Map<String, dynamic> json) {
    playerName = json['playerName'];
    plRankedKd = json['plRankedKd'];
    plRankedDeaths = json['plRankedDeaths'];
    plRankedKills = json['plRankedKills'];
    plRankedMatches = json['plRankedMatches'];
    plRankedWins = json['plRankedWins'];
    plRankedLosses = json['plRankedLosses'];
    plRankText = json['plRankText'];
    plThisSeasonRankedMmr = json['plThisSeasonRankedMmr'];
    plThisSeasonRankedKd = json['plThisSeasonRankedKd'];
    plProfilePic = json['plProfilePic'];
    plRankPic = json['plRankPic'];
    plTotalPlayTime = json['plTotalPlayTime'];
    plTotalMatchesPlayed = json['plTotalMatchesPlayed'];
    plTotalWins = json['plTotalWins'];
    plTotalLosses = json['plTotalLosses'];
    plTotalKills = json['plTotalKills'];
    plTotalDeaths = json['plTotalDeaths'];
    plTotalKD = json['plTotalKD'];
    plRankedPlayTime = json['plRankedPlayTime'];
    plCasualPlayTime = json['plCasualPlayTime'];
    plTotalKillAssists = json['plTotalKillAssists'];
    plTotalRevives = json['plTotalRevives'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playerName'] = this.playerName;
    data['plRankedKd'] = this.plRankedKd;
    data['plRankedDeaths'] = this.plRankedDeaths;
    data['plRankedKills'] = this.plRankedKills;
    data['plRankedMatches'] = this.plRankedMatches;
    data['plRankedWins'] = this.plRankedWins;
    data['plRankedLosses'] = this.plRankedLosses;
    data['plRankText'] = this.plRankText;
    data['plThisSeasonRankedMmr'] = this.plThisSeasonRankedMmr;
    data['plThisSeasonRankedKd'] = this.plThisSeasonRankedKd;
    data['plProfilePic'] = this.plProfilePic;
    data['plRankPic'] = this.plRankPic;
    data['plTotalPlayTime'] = this.plTotalPlayTime;
    data['plTotalMatchesPlayed'] = this.plTotalMatchesPlayed;
    data['plTotalWins'] = this.plTotalWins;
    data['plTotalLosses'] = this.plTotalLosses;
    data['plTotalKills'] = this.plTotalKills;
    data['plTotalDeaths'] = this.plTotalDeaths;
    data['plTotalKD'] = this.plTotalKD;
    data['plRankedPlayTime'] = this.plRankedPlayTime;
    data['plCasualPlayTime'] = this.plCasualPlayTime;
    data['plTotalKillAssists'] = this.plTotalKillAssists;
    data['plTotalRevives'] = this.plTotalRevives;
    return data;
  }
}
