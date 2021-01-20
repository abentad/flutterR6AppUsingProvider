import 'package:flutter/material.dart';
import 'package:flutterApiWithProvider/controllers/info_provider.dart';
import 'package:flutterApiWithProvider/services/api_service.dart';
import 'package:provider/provider.dart';

class Info extends StatefulWidget {
  final String playerName;

  Info(this.playerName);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    var provider = Provider.of<InfoProvider>(context, listen: false);
    provider.setPlayerInfo(await ApiService.fetchPlayerInfo(widget.playerName));
    provider.setIsProcessing(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.playerName),
      ),
      body: Center(
        child: Consumer<InfoProvider>(
          builder: (context, provider, widget) => provider.isProcessing
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(provider.playerInfo.playerName),
                    Text(provider.playerInfo.plCasualPlayTime),
                    Text(provider.playerInfo.plRankText),
                    Text(provider.playerInfo.plRankedKd),
                    Text(provider.playerInfo.plRankedKills),
                    Text(provider.playerInfo.plRankedDeaths),
                    Text(provider.playerInfo.plRankedLosses),
                    Text(provider.playerInfo.plRankedMatches),
                    Text(provider.playerInfo.plRankedPlayTime),
                    Text(provider.playerInfo.plRankedWins),
                    Text(provider.playerInfo.plThisSeasonRankedKd),
                    Text(provider.playerInfo.plThisSeasonRankedMmr),
                    Text(provider.playerInfo.plTotalDeaths),
                    Text(provider.playerInfo.plTotalKD),
                    Text(provider.playerInfo.plTotalKillAssists),
                    Text(provider.playerInfo.plTotalKills),
                    Text(provider.playerInfo.plTotalLosses),
                    Text(provider.playerInfo.plTotalMatchesPlayed),
                    Text(provider.playerInfo.plTotalPlayTime),
                    Text(provider.playerInfo.plTotalRevives),
                    Text(provider.playerInfo.plTotalWins),
                  ],
                ),
        ),
      ),
    );
  }
}