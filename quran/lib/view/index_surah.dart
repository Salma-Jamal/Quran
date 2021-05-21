import 'package:quran/widgets/bottomAnimation.dart';
import 'package:quran/controller/quran_api.dart';
import 'package:quran/widgets/closeBtn.dart';
import 'package:quran/widgets/flare.dart';
import 'package:quran/widgets/loadingShimmer.dart';
import 'package:quran/view/surah_page.dart';
import 'package:flutter/material.dart';

class SurahIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.brown[200],
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              FutureBuilder(
                future: Q_API().getSurahList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return LoadingShimmer(
                      text: "الآيات",
                    );
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      !snapshot.hasData) {
                    return Center(
                        child: Text(
                            "Connectivity Error! Please Try Again Later :)"));
                  } else if (snapshot.hasData == null) {
                    return Center(
                        child: Text(
                            "Connectivity Error! Please Check your Internet Connection"));
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      "Something went wrong on our side!\nWe are trying to reconnect :)",
                      textAlign: TextAlign.center,
                    ));
                  } else if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, 0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.brown[200], //Color(0xffee8f8b),
                            height: 2.0,
                          );
                        },
                        itemCount: snapshot.data.surahs.length,
                        itemBuilder: (context, index) {
                          return WidgetAnimator(
                            ListTile(
                              tileColor: Colors.brown[100],
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => SurahInformation(
                                    surahNumber:
                                        snapshot.data.surahs[index].number,
                                    arabicName:
                                        "${snapshot.data.surahs[index].name}",
                                    englishName:
                                        "${snapshot.data.surahs[index].englishName}",
                                    ayahs: snapshot
                                        .data.surahs[index].ayahs.length,
                                    revelationType:
                                        "${snapshot.data.surahs[index].revelationType}",
                                    englishNameTranslation:
                                        "${snapshot.data.surahs[index].englishNameTranslation}",
                                  ),
                                );
                              },
                              leading: Text(
                                  "${snapshot.data.surahs[index].number}",
                                  style: TextStyle(
                                      color: Colors.brown[
                                          500]) //Theme.of(context).textTheme.bodyText1,
                                  ),
                              title: Text(
                                "${snapshot.data.surahs[index].englishName}",
                                style: TextStyle(color: Colors.brown[500]),
                              ),
                              subtitle: Text(
                                "${snapshot.data.surahs[index].englishNameTranslation}",
                                style: TextStyle(color: Colors.brown[300]),
                              ),
                              trailing: Text(
                                "${snapshot.data.surahs[index].name}",
                                style: TextStyle(color: Colors.brown[500]),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SurahAyats(
                                              ayatsList: snapshot
                                                  .data.surahs[index].ayahs,
                                              surahName: snapshot
                                                  .data.surahs[index].name,
                                              surahEnglishName: snapshot.data
                                                  .surahs[index].englishName,
                                              englishMeaning: snapshot
                                                  .data
                                                  .surahs[index]
                                                  .englishNameTranslation,
                                            )));
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                        child:
                            Text("Connectivity Error! Please Try Again Later"));
                  }
                },
              ),
              Positioned(
                  top: height * 0.05, //42,
                  left: width * 0.75,
                  child: Text('السُوَر',
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: height * 0.06,
                          color: Colors.brown[100],
                          fontWeight: FontWeight.w800))),
              BackBtn(),
              Flare(
                color: Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -50,
                flareDuration: Duration(seconds: 17),
                left: 100,
                height: 60,
                width: 60,
              ),
              Flare(
                color: Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -50,
                flareDuration: Duration(seconds: 12),
                left: 10,
                height: 25,
                width: 25,
              ),
              Flare(
                color: Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -40,
                left: -100,
                flareDuration: Duration(seconds: 18),
                height: 50,
                width: 50,
              ),
              Flare(
                color: Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -50,
                left: -80,
                flareDuration: Duration(seconds: 15),
                height: 50,
                width: 50,
              ),
              Flare(
                color: Color(0xfff9e9b8),
                offset: Offset(width, -height),
                bottom: -20,
                left: -120,
                flareDuration: Duration(seconds: 12),
                height: 40,
                width: 40,
              ),
            ],
          ),
        ));
  }
}

class SurahInformation extends StatefulWidget {
  final int surahNumber;
  final String arabicName;
  final String englishName;
  final String englishNameTranslation;
  final int ayahs;
  final String revelationType;

  SurahInformation(
      {this.arabicName,
      this.surahNumber,
      this.ayahs,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType});

  @override
  _SurahInformationState createState() => _SurahInformationState();
}

class _SurahInformationState extends State<SurahInformation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ScaleTransition(
      scale: scaleAnimation,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            width: width * 0.75,
            height: height * 0.37,
            decoration: ShapeDecoration(
                color: Colors.grey[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Surah Information",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.englishName,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      widget.arabicName,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Text("Ayahs: ${widget.ayahs}"),
                Text("Surah Number: ${widget.surahNumber}"),
                Text("Chapter: ${widget.revelationType}"),
                Text("Meaning: ${widget.englishNameTranslation}"),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.05,
                  child: FlatButton(
                      color: Color(0xffee8f8b),
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
