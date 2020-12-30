import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> {

  var dateTextStyle =
  TextStyle(
    fontSize: 18, color: Color(0xFF004A82), fontWeight: FontWeight.bold,);


  int touchedIndex;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          padding: EdgeInsets.all(8),
          crossAxisCount: 4,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 8.0,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: myTextItems("New Orders", "No New Order"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: myStockTab(68),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: myTextItems("Total Sold Items", "1262"),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: myLineChart(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myPiChart(),
            ),

          ],
          staggeredTiles: [

            StaggeredTile.extent(2, 150.0),
            StaggeredTile.extent(2, 312.0),
            StaggeredTile.extent(2, 150.0),
            StaggeredTile.extent(4, 450.0),

          ],
        ),
      ),
    );
  }

  Material myPiChart() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24),
      shadowColor: Color(0x802196F3),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("data",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            children: [
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: PieChart(
                  PieChartData(
                      pieTouchData:
                          PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Indicator('test', Color(0xfff8b250)),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator('Second', const Color(0xff0293ee)),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator('Third', Color(0xff845bef)),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator('Forth', Colors.orange),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }


  Material myLineChart() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24),
      shadowColor: Color(0xFF707070),
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
                      isCurved: false,
                      barWidth: 8,
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
                        reservedSize: 12,
                        textStyle: dateTextStyle,
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
                      textStyle: dateTextStyle,
                      getTitles: (value) {
                        return '${value + 1}K';
                      },
                    ),
                  ),
                  axisTitleData: FlAxisTitleData(
                      leftTitle: AxisTitle(
                          reservedSize: 12,
                          showTitle: true,
                          titleText: 'Value',
                          textStyle: dateTextStyle,
                          margin: 12),
                      bottomTitle: AxisTitle(
                          showTitle: true,
                          margin: 4,
                          titleText: '2019',
                          textStyle: dateTextStyle,
                          textAlign: TextAlign.center)),
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


  Material myTextItems(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(title, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Color(0xFF004A82),
            ),),
          ),

          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(subtitle, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF707070)
            ),),
          ),

        ],
      ),
    );
  }

  Material myStockTab(int val) {
    var min_val = 0 + val;
    var max_val = 100 - val;
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Colors.black12,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text("Stock", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Color(0xFF004A82),
              ),),
            ),
            Column(

              children: [
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: AnimatedCircularChart(
                    duration: Duration(milliseconds: 1000),
                    size: const Size(200.0, 200.0),
                    initialChartData: [
                      new CircularStackEntry(
                        <CircularSegmentEntry>[
                          new CircularSegmentEntry(
                              max_val.toDouble(), Colors.white, rankKey: 'Q1'),
                          new CircularSegmentEntry(
                              min_val.toDouble(), Color(0xff40b24b),
                              rankKey: 'Q4'),
                        ],
                        rankKey: 'Quarterly Profits',
                      ),
                    ],
                    startAngle: -10,
                    holeRadius: 20,
                    chartType: CircularChartType.Radial,
                  ),
                ),
                Text("$val%", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Color(0xFF004A82),
                ),
                  textAlign: TextAlign.center,),
              ],),
/*

*/


          ],
        ),
      ),
    );
  }


  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}

// ignore: must_be_immutable
class Indicator extends StatelessWidget {

  Color color;
  String text;

  Indicator(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Row(children: [
        Container(
          height: 15,
          width: 15,
          color: color,
        ),
        SizedBox(width: 8,),
        Text(text)
      ],),
    );
  }
}

