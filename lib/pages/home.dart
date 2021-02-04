import 'package:adobe_xd/pinned.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:berbera_app/config/Config.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }}

  class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          Container(
        margin: EdgeInsets.all(10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey,
            ),
        child: Stack(
          children: <Widget>[

         Container(
           margin: EdgeInsets.only(top: 15),
           alignment: Alignment.center,
           child: Text(
                  Config.store_name,
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 20,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),

         ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40) ,
              child: Config.isOffline ?Text(
              "Offline",
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: Colors.red,
              ),
              textAlign: TextAlign.left,
            ):Text(
              "Online",
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: Colors.green,
              ),
              textAlign: TextAlign.left,
            )
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all( 12),
              child: CircleAvatar(
              //  child: Image.network("${Config.image_url}"),
                maxRadius: 30,
                minRadius: 25,
              ),
            ),
          ],
        ),
      ),

          Container(
            height: 125,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xb0eb9335),
            ),
        child: Stack(
          children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15,top: 15),
            child: Text(
                  'Total Sales',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 29,
                    color: const Color(0xff4d006a),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
          ),
            Container(
margin: EdgeInsets.only(left: 15, top: 45),
              child: Text(
                'Total sales made on Berbera',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: const Color(0xc14d006a),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15,bottom: 15),
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                  'Br 43,000',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 26,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
            ),


          ],
        ),
      ),

          Container(
            height: 125,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xff4d006a),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15,top: 15),
                  child: Text(
                    'Total Sold Items',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 29,
                      color: const Color(0xb0eb9335),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 45),
                  child: Text(
                    'Total sold items on Berbera',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      color: const Color(0xb0eb9335),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15,bottom: 15),
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(
                    '2000',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 26,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              //color: const Color(0xff4d006a),
            ),
            child: myLineChart(),
          )

        ],
      ),
    )
    );
  }

  Material myLineChart() {
    return Material(
      color: Colors.white,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(24),
     // shadowColor: Color(0xFF707070),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Monthly Sales", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Color(0xFF004A82),
              )),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 25),
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(enabled: true,),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 2.5),
                        FlSpot(2, 2),
                        FlSpot(3, 4),
                        FlSpot(4, 3),
                      ],
                      isCurved: true,
                      barWidth: 5,
                      colors: [
                        Colors.orange,
                      ],
                      belowBarData: BarAreaData(
                        show: false,
                        colors: [
                          Colors.deepOrange,
                          Colors.orange,
                          Colors.white
                        ],

                      ),

                      dotData: FlDotData(
                        show: true,
                      ),
                    ),
                  ],
                  minY: 0,
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 10,
                      //  textStyle: dateTextStyle,
                        getTitles: (value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Jan';
                            case 1:
                              return 'Feb';
                            case 2:
                              return 'Mar';
                            case 3:
                              return 'Apr';
                            case 4:
                              return 'May';
                            default:
                              return '';
                          }
                        }),
                    leftTitles: SideTitles(
                      reservedSize: 25,
                      showTitles: true,
                    //  getTextStyles: dateTextStyle,
                      getTitles: (value) {
                        return '${value + 1}K';
                      },
                    ),
                  ),

                  gridData: FlGridData(
                    show: true,
                  ),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  }

