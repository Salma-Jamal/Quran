import 'package:quran/widgets/bottomAnimation.dart';
import 'package:quran/model/surahModel.dart';
import 'package:flutter/material.dart';

class SurahAyats extends StatelessWidget {
  final List<Ayat> ayatsList;
  final String surahName;
  final String surahEnglishName;
  final String englishMeaning;
  SurahAyats(
      {this.ayatsList,
      this.englishMeaning,
      this.surahEnglishName,
      this.surahName});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.brown[50],
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.brown[200],
              pinned: true,
              expandedHeight: height * 0.27,
              flexibleSpace: flexibleAppBar(context, height, width),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: Center(
                    child: Text(
                  'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: height * 0.04,
                      color: Colors.brown[300],
                      fontWeight: FontWeight.normal),
                )),
                width: 200,
                color: Colors.brown[50],
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
              child: line(height, 0, width, true),
            )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => line(height, index, width, false),
                  childCount: ayatsList.length - 1),
            )
          ],
        ));
  }

  Widget line(double height, int index, double width, bool first) {
    if (first == false) {
      if (this.surahEnglishName != "Al-Faatiha") {
        return Padding(
          padding: EdgeInsets.fromLTRB(width * 0.015, 0, 0, 0),
          child: WidgetAnimator(
            ListTile(
              trailing: CircleAvatar(
                radius: height * 0.013,
                backgroundColor: Color(0xff04364f),
                child: CircleAvatar(
                    //radius: height * 0.012,
                    backgroundColor: Colors.brown[400],
                    child: Text(
                      ayatsList[index + 1].number.toString(),
                      style: TextStyle(
                          fontSize: height * 0.015, color: Colors.brown[100]),
                    )),
              ),
              title: Text(ayatsList[index + 1].text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: height * 0.03, color: Colors.brown[300])),
            ),
          ),
        );
      } else {
        if (this.surahEnglishName == "Al-Faatiha") {
          return Padding(
            padding: EdgeInsets.fromLTRB(width * 0.015, 0, 0, 0),
            child: WidgetAnimator(
              ListTile(
                trailing: CircleAvatar(
                  radius: height * 0.013,
                  backgroundColor: Color(0xff04364f),
                  child: CircleAvatar(
                      //radius: height * 0.012,
                      backgroundColor: Colors.brown[400],
                      child: Text(
                        ayatsList[index].number.toString(),
                        style: TextStyle(
                            fontSize: height * 0.015, color: Colors.brown[100]),
                      )),
                ),
                title: Text(ayatsList[index + 1].text,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: height * 0.03, color: Colors.brown[300])),
              ),
            ),
          );
        } else if (this.surahEnglishName == "At-Tawba") {
          return Padding(
            padding: EdgeInsets.fromLTRB(width * 0.015, 0, 0, 0),
            child: WidgetAnimator(
              ListTile(
                trailing: CircleAvatar(
                  radius: height * 0.013,
                  backgroundColor: Color(0xff04364f),
                  child: CircleAvatar(
                      //radius: height * 0.012,
                      backgroundColor: Colors.brown[400],
                      child: Text(
                        ayatsList[index].number.toString(),
                        style: TextStyle(
                            fontSize: height * 0.015, color: Colors.brown[100]),
                      )),
                ),
                title: Text(ayatsList[index].text,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: height * 0.03, color: Colors.brown[300])),
              ),
            ),
          );
        }
      }
    } else {
      if (this.surahEnglishName != "Al-Faatiha" &&
          this.surahEnglishName != "At-Tawba") {
        return Padding(
          padding: EdgeInsets.fromLTRB(width * 0.015, 0, 0, 0),
          child: WidgetAnimator(
            ListTile(
              trailing: CircleAvatar(
                radius: height * 0.013,
                backgroundColor: Color(0xff04364f),
                child: CircleAvatar(
                    //radius: height * 0.012,
                    backgroundColor: Colors.brown[400],
                    child: Text(
                      ayatsList[index].number.toString(),
                      style: TextStyle(
                          fontSize: height * 0.015, color: Colors.brown[100]),
                    )),
              ),
              title: Text(ayatsList[0].text.split('ٱلرَّحِيمِ')[1],
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: height * 0.03, color: Colors.brown[300])),
            ),
          ),
        );
      } else if (this.surahEnglishName == "At-Tawba") {
        return Padding(
          padding: EdgeInsets.fromLTRB(width * 0.015, 0, 0, 0),
          child: WidgetAnimator(
            ListTile(
              trailing: CircleAvatar(
                radius: height * 0.013,
                backgroundColor: Color(0xff04364f),
                child: CircleAvatar(
                    //radius: height * 0.012,
                    backgroundColor: Colors.brown[400],
                    child: Text(
                      ayatsList[index].number.toString(),
                      style: TextStyle(
                          fontSize: height * 0.015, color: Colors.brown[100]),
                    )),
              ),
              title: Text(ayatsList[0].text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: height * 0.03, color: Colors.brown[300])),
            ),
          ),
        );
      }
    }
  }

  Widget flexibleAppBar(BuildContext context, double width, double height) {
    return FlexibleSpaceBar(
        centerTitle: true,
        title: Text(surahName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: height * 0.045,
                color: Colors.brown[600])),
        background: Stack(
          children: <Widget>[
            // quranImageAppBar(height),
            //infoInAppBar(context),
          ],
        ));
  }

  Widget infoInAppBar(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(englishMeaning),
          Text(surahName, style: TextStyle(fontSize: 15))
        ],
      ),
    );
  }
}
