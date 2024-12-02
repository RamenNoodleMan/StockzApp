import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'company_details.dart';
import 'marketdata.dart';


class Chart extends StatefulWidget {




  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<ChartSampleData> _chartData;
  @override
  void initState(){
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var chartData;
    return SafeArea(
      child: Scaffold(

      appBar: AppBar(backgroundColor: Colors.black,
      elevation: 0,
      title: Text('STOCK SALE PRICE CHART',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24)),
    ),

          body: SfCartesianChart(
            series: <CandleSeries>[
              CandleSeries<ChartSampleData, DateTime>(
                  dataSource: _chartData,
                  xValueMapper: (ChartSampleData sales, _) => sales.x,
                  lowValueMapper: (ChartSampleData sales, _) => sales.low,
                  highValueMapper: (ChartSampleData sales, _) => sales.high,
                  openValueMapper: (ChartSampleData sales, _) => sales.open,
                  closeValueMapper: (ChartSampleData sales, _) => sales.close)
            ],
            primaryXAxis: DateTimeAxis(),
            zoomPanBehavior: ZoomPanBehavior(
              enablePanning: true,
            ),

          ))
    );
  }

  List<ChartSampleData> getChartData(){
    return <ChartSampleData>[
      ChartSampleData(
          x: DateTime(2022,5,20),
          open: 7.45,
          high: 8.34,
          low: 3.34,
          close: 10.34),
      ChartSampleData(
          x: DateTime(2022,5,21),
          open: 14.45,
          high: 20.34,
          low: 4.34,
          close: 5.34),
      ChartSampleData(
          x: DateTime(2022,5,22),
          open: 5.45,
          high: 20.34,
          low: 2.34,
          close: 14.34),
      ChartSampleData(
          x: DateTime(2022,5,23),
          open: 7.45,
          high: 20.34,
          low: 5.34,
          close: 10.34),
      ChartSampleData(
          x: DateTime(2022,5,24),
          open: 9.45,
          high: 13.34,
          low: 1.34,
          close: 4.34),
      ChartSampleData(
          x: DateTime(2022,5,25),
          open: 15.45,
          high: 13.34,
          low: 10.34,
          close: 13.34),
      ChartSampleData(
          x: DateTime(2022,5,26),
          open: 7.45,
          high: 13.34,
          low: 1.34,
          close: 13.34),
      ChartSampleData(
          x: DateTime(2022,5,27),
          open: 9.45,
          high: 18.34,
          low: 4.34,
          close: 16.34),
      ChartSampleData(
          x: DateTime(2022,5,28),
          open: 9.45,
          high: 13.34,
          low: 3.34,
          close: 4.34),
      ChartSampleData(
          x: DateTime(2022,5,29),
          open: 10.45,
          high: 13.34,
          low: 3.34,
          close: 4.34),
      ChartSampleData(
          x: DateTime(2022,5,30),
          open: 10.45,
          high: 19.34,
          low: 7.34,
          close: 16.34),
      ChartSampleData(
          x: DateTime(2022,5,31),
          open: 10.45,
          high: 15.34,
          low: 7.34,
          close: 8.34),
      ChartSampleData(
          x: DateTime(2022,6,1),
          open: 14.45,
          high: 13.34,
          low: 9.34,
          close: 10.34),
      ChartSampleData(
          x: DateTime(2022,6,2),
          open: 5.45,
          high: 13.34,
          low: 2.34,
          close: 4.34),
      ChartSampleData(
          x: DateTime(2022,6,3),
          open: 10.45,
          high: 13.34,
          low: 10.34,
          close: 5.34),
      ChartSampleData(
          x: DateTime(2022,6,4),
          open: 4.45,
          high: 13.34,
          low: 3.34,
          close: 5.34),
      ChartSampleData(
          x: DateTime(2022,6,5),
          open: 2.45,
          high: 13.34,
          low: 1.34,
          close: 9.34),
      ChartSampleData(
          x: DateTime(2022,6,6),
          open: 6.45,
          high: 13.34,
          low: 1.34,
          close: 3.34),
      ChartSampleData(
          x: DateTime(2022,6,7),
          open: 16.45,
          high: 24.34,
          low: 1.34,
          close: 18.34),
      ChartSampleData(
          x: DateTime(2022,6,8),
          open: 12.45,
          high: 13.34,
          low: 1.34,
          close: 4.34),
      ChartSampleData(
          x: DateTime(2022,6,9),
          open: 9.45,
          high: 13.34,
          low: 1.34,
          close: 10.34),
      ChartSampleData(
          x: DateTime(2022,6,10),
          open: 9.45,
          high: 13.34,
          low: 1.34,
          close: 4.34),
      ChartSampleData(
          x: DateTime(2022,6,11),
          open: 17.45,
          high: 23.34,
          low: 1.34,
          close: 20.34),
      ChartSampleData(
          x: DateTime(2022,6,12),
          open: 15.45,
          high: 23.34,
          low: 1.34,
          close: 20.34),
      ChartSampleData(
          x: DateTime(2022,6,13),
          open: 13.45,
          high: 23.34,
          low: 1.34,
          close: 17.34),
      ChartSampleData(
          x: DateTime(2022,6,14),
          open: 9.45,
          high: 10.34,
          low: 4.34,
          close: 6.34),
      ChartSampleData(
          x: DateTime(2022,6,15),
          open: 13.45,
          high: 17.34,
          low: 4.34,
          close: 15.34),
      ChartSampleData(
          x: DateTime(2022,6,16),
          open: 13.45,
          high: 18.34,
          low: 10.34,
          close: 17.34),
      ChartSampleData(
          x: DateTime(2022,6,17),
          open: 18.45,
          high: 19.34,
          low: 10.34,
          close: 17.34),
      ChartSampleData(
          x: DateTime(2022,6,18),
          open: 13.45,
          high: 18.34,
          low: 6.34,
          close: 9.34),
      ChartSampleData(
          x: DateTime(2022,6,19),
          open: 17.45,
          high: 18.34,
          low: 10.34,
          close: 13.34),
      ChartSampleData(
          x: DateTime(2022,6,20),
          open: 7.45,
          high: 8.34,
          low: 4.34,
          close: 6.34),
      ChartSampleData(
          x: DateTime(2022,6,21),
          open: 5.45,
          high: 8.34,
          low: 2.34,
          close: 3.34),
      ChartSampleData(
          x: DateTime(2022,6,22),
          open: 6.45,
          high: 10.34,
          low: 2.34,
          close: 8.34),
      ChartSampleData(
          x: DateTime(2022,6,23),
          open: 8.45,
          high: 12.34,
          low: 4.34,
          close: 9.34),
      ChartSampleData(
          x: DateTime(2022,6,24),
          open: 10.45,
          high: 14.34,
          low: 6.34,
          close: 11.34),
      ChartSampleData(
          x: DateTime(2022,6,25),
          open: 7.45,
          high: 10.34,
          low: 2.34,
          close: 7.34),
      ChartSampleData(
          x: DateTime(2022,6,26),
          open: 8.45,
          high: 12.34,
          low: 4.34,
          close: 9.34),







    ];
  }
}

class ChartSampleData{
  ChartSampleData({
    this.x,
    this.open,
    this.close,
    this.low, this.high
  });
  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}