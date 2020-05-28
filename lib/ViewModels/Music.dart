import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() {

    return _MusicPageState();
  }
}

class _MusicPageState extends State<MusicPage> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  final assetsAudioPlayer = AssetsAudioPlayer();
  int position = 0;
  bool playing = false;
  List<SongInfo> _songs;
  final audios = <Audio>[];

  @override
  void initState() {
    super.initState();
    getSongs();
  }

  void getSongs() async{
    var songs = await audioQuery.getSongs();
    songs = new List.from(songs);
    setState(() {
      _songs = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Colors.white,

      body: Stack(
        children: <Widget>[
          new ListView.builder(
              itemCount: _songs.length,
              itemBuilder: (context, int index){
                return new ListTile(
                  leading: CircleAvatar(
                    child: new Text(_songs[index].title[0]),
                  ),
                  title: new Text(_songs[index].title),
                  onTap: () async{
                    position = index;
                    String filePath = _songs[index].filePath;

                    await assetsAudioPlayer.open(Audio.file(filePath));
                     assetsAudioPlayer.play();
                     setState(() {
                       playing = true;
                     });

                  },
                );
              }
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: 80,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1, top: MediaQuery.of(context).size.height*0.6),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[
                IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () async {
                  if (position > 0) {
                    position--;
                    String filePath = _songs[position].filePath;
                    await assetsAudioPlayer.open(Audio.file(filePath));
                    assetsAudioPlayer.play();
                    playing = true;
                    print(position);
                  }
                  else{
                    position = _songs.length - 1;
                    String filePath = _songs[position].filePath;
                    await assetsAudioPlayer.open(Audio.file(filePath));
                    assetsAudioPlayer.play();
                    playing = true;
                    print(position);

                  }
                },
                ),

                IconButton(
                    icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                    onPressed: (){
                        assetsAudioPlayer.playOrPause();
                        if(playing){
                          setState(() {
                            playing = false;
                          });
                        }
                        else{
                          setState(() {
                            playing = true;
                          });
                        }
                    }
                ),
                SizedBox (
                    width: 16
                ),
                IconButton(
                    icon: Icon(Icons.stop),
                    onPressed: (){
                      assetsAudioPlayer.stop();
                      setState(() {
                        playing = false;
                      });
                    }
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: () async {
                    if(position < _songs.length-1){
                        position++;
                        String filePath = _songs[position].filePath;
                        await assetsAudioPlayer.open(Audio.file(filePath));
                        assetsAudioPlayer.play();
                        playing = true;
                        print(position);

                    }
                    else{
                      position = 0;
                      String filePath = _songs[position].filePath;
                      await assetsAudioPlayer.open(Audio.file(filePath));
                      assetsAudioPlayer.play();
                      playing = true;
                      print(position);

                    }
                  },
                )

              ],
            ),

          )
        ],

      ),

    );
  }
}
