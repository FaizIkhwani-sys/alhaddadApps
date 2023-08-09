import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class RetailerUtamaPage extends StatelessWidget {
  const RetailerUtamaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RetailerUtamaState(),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(4, 8, 4, 16),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    final state = context.read<RetailerUtamaState>();

    state.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerUtamaState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [_SalesSummary(), _StackedChart()],
              );
      },
    );
  }
}

class _SalesSummary extends StatelessWidget {
  const _SalesSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerUtamaState>(
      builder: (_, state, __) {
        return GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            _JualanBulanIni(),
            _JualanHariIni(),
            _MonthlyOnlineOrder(),
            _TotalProductSold(),
          ],
        );
      },
    );
  }
}

class _JualanBulanIni extends StatelessWidget {
  const _JualanBulanIni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerUtamaState>(
      builder: (_, state, __) {
        return AppsHomeMenuCard(
          menuName: "PENDAPATAN BULANAN".capitalizeFirstofEach,
          amaunData:
              "RM${(double.parse(state.jumlahSalesBulanan![0].onl!) + (double.parse(state.jumlahSalesBulanan![0].activation!)) + (double.parse(state.jumlahSalesBulanan![0].internal!)) + (double.parse(state.jumlahSalesBulanan![0].offl!)) + (double.parse(state.jumlahSalesBulanan![0].offl!)) + (double.parse(state.jumlahSalesBulanan![0].pos!)))}0",
          icons: Icons.monetization_on_outlined,
          colors:
              Colors.primaries[state.random.nextInt(Colors.primaries.length)]
                      [state.random.nextInt(9) * 100] ??
                  primaryColor,
        );
      },
    );
  }
}

class _JualanHariIni extends StatelessWidget {
  const _JualanHariIni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerUtamaState>(
      builder: (_, state, __) {
        return AppsHomeMenuCard(
          menuName: "JUALAN HARI INI".capitalizeFirstofEach,
          amaunData:
              'RM${double.parse(state.jumlahSalesHarian![0].pos!) + double.parse(state.jumlahSalesHarian![0].internal!) + double.parse(state.jumlahSalesHarian![0].activation!) + double.parse(state.jumlahSalesHarian![0].offl!) + double.parse(state.jumlahSalesHarian![0].onl!)}0',
          icons: Icons.monetization_on_outlined,
          colors:
              Colors.primaries[state.random.nextInt(Colors.primaries.length)]
                      [state.random.nextInt(9) * 100] ??
                  primaryColor,
        );
      },
    );
  }
}

class _MonthlyOnlineOrder extends StatelessWidget {
  const _MonthlyOnlineOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerUtamaState>(
      builder: (_, state, __) {
        return AppsHomeMenuCard(
          menuName: "PESANAN ONLINE BULANAN".capitalizeFirstofEach,
          amaunData: state.onlineOrderBulanan![0].onl!,
          icons: Icons.monetization_on_outlined,
          colors:
              Colors.primaries[state.random.nextInt(Colors.primaries.length)]
                      [state.random.nextInt(9) * 100] ??
                  primaryColor,
        );
      },
    );
  }
}

class _TotalProductSold extends StatelessWidget {
  const _TotalProductSold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerUtamaState>(
      builder: (_, state, __) {
        return AppsHomeMenuCard(
          menuName: "CUKAI BULANAN".capitalizeFirstofEach,
          amaunData: 'RM${state.jumlahProdukTerjual![0].tax!}',
          icons: Icons.monetization_on_outlined,
          colors:
              Colors.primaries[state.random.nextInt(Colors.primaries.length)]
                      [state.random.nextInt(9) * 100] ??
                  primaryColor,
        );
      },
    );
  }
}

class _TryChart extends StatefulWidget {
  @override
  State<_TryChart> createState() => _TryChartState();
}

class _TryChartState extends State<_TryChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerUtamaState>(
      builder: (context, state, child) {
        var color =
            Colors.primaries[state.random.nextInt(Colors.primaries.length)]
                    [state.random.nextInt(9) * 100] ??
                primaryColor;
        // print("${state.data[0].year}${state.data[0].sales}");
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(children: [
            //Initialize the chart widget
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color,
                    color.withOpacity(0.5),
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: SfCartesianChart(
                  plotAreaBackgroundColor: Colors.white,
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(
                      text: 'Monthly Sales Analysis',
                      textStyle: TextStyle(
                          fontFamily: "Manrope",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700)),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <LineSeries<GetSalesHarianByMonth, String>>[
                    LineSeries<GetSalesHarianByMonth, String>(
                        dataSource: state.salesHarianByMonth!,
                        xValueMapper: (GetSalesHarianByMonth sales, _) =>
                            DateFormat('dd MMM')
                                .format(DateTime.parse(sales.orderDate!)),
                        yValueMapper: (GetSalesHarianByMonth sales, _) =>
                            double.parse(sales.total!),
                        pointColorMapper: (GetSalesHarianByMonth sales, _) =>
                            Colors.red,
                        name: 'Sales',
                        width: 0.8,
                        xAxisName: 'Sales(RM)',
                        yAxisName: 'Days',
                        enableTooltip: true,
                        markerSettings: MarkerSettings(
                            isVisible: true, borderColor: Colors.black),
                        isVisible: true,
                        dataLabelMapper: (GetSalesHarianByMonth sales, _) =>
                            sales.total,
                        color: Colors.black,
                        dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.bold)))
                  ]),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   //Initialize the spark charts widget
            //   child: Container(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           Colors.brown,
            //           Colors.brown.withOpacity(0.5),
            //           Colors.white,
            //         ],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //       ),
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: SfSparkLineChart.custom(
            //
            //         highPointColor: Colors.red,
            //         lowPointColor: Colors.red,
            //         firstPointColor: Colors.orange,
            //         lastPointColor: Colors.orange,
            //         color: primaryColor,
            //         // dataLabelMapper: (SalesData sales, _) => sales.days,
            //         //Enable the trackball
            //         trackball: SparkChartTrackball(
            //             activationMode: SparkChartActivationMode.tap),
            //         //Enable marker
            //         marker: SparkChartMarker(
            //             displayMode: SparkChartMarkerDisplayMode.all),
            //         //Enable data label
            //         labelDisplayMode: SparkChartLabelDisplayMode.all,
            //         xValueMapper: (int index) => state.data[index].days,
            //         yValueMapper: (int index) => state.data[index].sales,
            //         dataCount: state.data.length,
            //       ),
            //     ),
            //   ),
            // ),
            // LineChart(
            //   LineChartData(
            //     minX: 0,
            //     maxX: 11,
            //     minY: 0,
            //     maxY: 6,
            //     titlesData: LineTitles.getTitleData(),
            //     gridData: FlGridData(
            //       show: true,
            //       getDrawingHorizontalLine: (value) {
            //         return FlLine(
            //           color: const Color(0xff37434d),
            //           strokeWidth: 1,
            //         );
            //       },
            //       drawVerticalLine: true,
            //       getDrawingVerticalLine: (value) {
            //         return FlLine(
            //           color: const Color(0xff37434d),
            //           strokeWidth: 1,
            //         );
            //       },
            //     ),
            //     borderData: FlBorderData(
            //       show: true,
            //       border: Border.all(color: const Color(0xff37434d), width: 1),
            //     ),
            //     lineBarsData: [
            //       LineChartBarData(
            //         spots: [
            //           FlSpot(0, 3),
            //           FlSpot(2.6, 2),
            //           FlSpot(4.9, 5),
            //           FlSpot(6.8, 2.5),
            //           FlSpot(8, 4),
            //           FlSpot(9.5, 3),
            //           FlSpot(11, 4),
            //         ],
            //         isCurved: true,
            //         colors: [Colors.red],
            //         barWidth: 5,
            //         // dotData: FlDotData(show: false),
            //         belowBarData: BarAreaData(
            //           show: true,
            //           // colors: gradientColors
            //           //     .map((color) => color.withOpacity(0.3))
            //           //     .toList(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ]),
        );
      },
    );
  }
}

class _StackedChart extends StatelessWidget {
  const _StackedChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerUtamaState>(
      builder: (_, state, __) {
        return Column(
          children: [
            ...List.generate(
              1,
              (i) => Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    title: ChartTitle(text: 'Monthly Sales'),
                    legend: Legend(
                      position: LegendPosition.bottom,
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    primaryXAxis: CategoryAxis(
                      labelRotation: -45,
                      maximumLabels: 6,
                      isVisible: true,
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(
                        axisLine: const AxisLine(width: 0),
                        labelFormat: 'RM{value}',
                        maximum: 2000,
                        majorTickLines: const MajorTickLines(size: 0)),
                    series: <StackedColumnSeries<MonthlySales, String>>[
                      StackedColumnSeries<MonthlySales, String>(
                          dataSource: state.monthlySales!,
                          xValueMapper: (MonthlySales sales, _) =>
                              sales.pilihanLabel2 as String,
                          yValueMapper: (MonthlySales sales, _) =>
                              double.parse(sales.onl!),
                          name: 'Online'),
                      StackedColumnSeries<MonthlySales, String>(
                          dataSource: state.monthlySales!,
                          xValueMapper: (MonthlySales sales, _) =>
                              sales.pilihanLabel2 as String,
                          yValueMapper: (MonthlySales sales, _) =>
                              double.parse(sales.pos!),
                          name: 'POS'),
                      StackedColumnSeries<MonthlySales, String>(
                          dataSource: state.monthlySales!,
                          xValueMapper: (MonthlySales sales, _) =>
                              sales.pilihanLabel2 as String,
                          yValueMapper: (MonthlySales sales, _) =>
                              double.parse(sales.internal!),
                          name: 'Internal'),
                      StackedColumnSeries<MonthlySales, String>(
                          dataSource: state.monthlySales!,
                          xValueMapper: (MonthlySales sales, _) =>
                              sales.pilihanLabel2 as String,
                          yValueMapper: (MonthlySales sales, _) =>
                              double.parse(sales.reject!),
                          name: 'Reject'),
                      StackedColumnSeries<MonthlySales, String>(
                          dataSource: state.monthlySales!,
                          xValueMapper: (MonthlySales sales, _) =>
                              sales.pilihanLabel2 as String,
                          yValueMapper: (MonthlySales sales, _) =>
                              double.parse(sales.activation!),
                          name: 'Activation'),
                      StackedColumnSeries<MonthlySales, String>(
                          dataSource: state.monthlySales!,
                          xValueMapper: (MonthlySales sales, _) =>
                              sales.pilihanLabel2 as String,
                          yValueMapper: (MonthlySales sales, _) =>
                              double.parse(sales.offl!),
                          name: 'Offline'),
                    ],
                    tooltipBehavior: TooltipBehavior(
                        enable: true, header: '', canShowMarker: true),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

//
// class _TryChart extends StatefulWidget {
//   const _TryChart({Key? key}) : super(key: key);
//
//   @override
//   State<_TryChart> createState() => _TryChartState();
// }
//
// class _TryChartState extends State<_TryChart> {
//   @override
//   void initState() {
//     // context.read<AdminUtamaState>().data = List<charts.Series<SalesData,String>>().cast<SalesData>();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class LineTitles {
//   static getTitleData() => FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 35,
//           getTextStyles: (value) => const TextStyle(
//             color: Color(0xff68737d),
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 2:
//                 return 'MAR';
//               case 5:
//                 return 'JUN';
//               case 8:
//                 return 'SEP';
//             }
//             return '';
//           },
//           margin: 8,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (value) => const TextStyle(
//             color: Color(0xff67727d),
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//           ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return '10k';
//               case 3:
//                 return '30k';
//               case 5:
//                 return '50k';
//             }
//             return '';
//           },
//           reservedSize: 35,
//           margin: 12,
//         ),
//       );
// }
