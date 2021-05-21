import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/view/index_surah.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/n.png"), fit: BoxFit.cover)),
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * .05),
                Container(
                    width: width * .40, //150.0,
                    height: height * .07, // 40.0,
                    decoration: BoxDecoration(
                      color: Colors.black38, //Colors.orange[200],
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Stack(children: [
                      Center(
                        child: Text('قراءة',
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: height * 0.03,
                                color: Colors.black)),
                      ),
                      Center(
                          child: MaterialButton(
                        padding: EdgeInsets.all(8.0),
                        elevation: 0.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SurahIndex()),
                          );
                        },
                      )),
                    ])),
                SizedBox(height: height * .01),
                Container(
                    width: width * .40, //150.0,
                    height: height * .07,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Stack(children: [
                      Center(
                        child: Text('الخروج',
                            style: TextStyle(
                                fontSize: height * 0.03, color: Colors.black)),
                      ),
                      Center(
                          child: MaterialButton(
                        padding: EdgeInsets.all(8.0),
                        elevation: 0.0,
                        onPressed: () => SystemNavigator.pop(),
                      )),
                    ])),
              ],
            )));
  }
}
