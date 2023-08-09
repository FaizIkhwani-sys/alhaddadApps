import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

late FocusNode _searchNode;

class RetailerSalesPage extends StatelessWidget {
  const RetailerSalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RetailerProfileState(),
      child: Consumer<RetailerProfileState>(
        builder: (_, state, __) {
          return AppSecondaryBar(
            title: 'Sales',
            body: SingleChildScrollView(child: _Body()),
            backgroundColor: backgroundColor,
            actions: [
              InkWell(
                onTap: () {
                  state.isClicked = !state.isClicked;
                },
                child: Icon(Icons.search),
              )
            ],
          );
        },
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

    final state = context.read<RetailerProfileState>();

    state.getJualanRetailer('');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return Column(
          children: [
            state.isClicked
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _SearchField(),
                  )
                : Container(),
            state.isLoading
                ? AppLoadingOverlay()
                : state.jualan == null
                    ? Center(
                        child: TextManrope(
                          text: 'Sorry, no search result',
                        ),
                      )
                    : Column(
                        children: [
                          _StackedChart(),
                          // Container(
                          //   width: AppSize.widthScreen(context),
                          //   child: Table(
                          //     border: TableBorder.all(),
                          //     defaultColumnWidth: IntrinsicColumnWidth(),
                          //     children: [
                          //       TableRow(children: [
                          //         TextManrope(
                          //           text: 'Bil',
                          //           maxLines: 3,
                          //         ),
                          //         TextManrope(
                          //           text: 'Product Name',
                          //           maxLines: 3,
                          //         ),
                          //         TextManrope(
                          //           text: 'Online',
                          //           maxLines: 3,
                          //         ),
                          //         TextManrope(
                          //           text: 'POS',
                          //           maxLines: 3,
                          //         ),
                          //         TextManrope(
                          //           text: 'Internal Sales',
                          //           maxLines: 3,
                          //         ),
                          //       ]),
                          //       ...List.generate(
                          //           state.sales!.length,
                          //           (i) => TableRow(children: [
                          //                 TextManrope(text: '${i + 1}'),
                          //                 TextManrope(
                          //                   text: state.sales![i].name!,
                          //                   maxLines: 10,
                          //                 ),
                          //                 TextManrope(
                          //                   text: 'RM${state.sales![i].onl!}',
                          //                   maxLines: 3,
                          //                 ),
                          //                 TextManrope(
                          //                   text: 'RM${state.sales![i].pos!}',
                          //                   maxLines: 3,
                          //                 ),
                          //                 TextManrope(
                          //                   text:
                          //                       'RM${state.sales![i].internal!}',
                          //                   maxLines: 3,
                          //                 ),
                          //               ]))
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
          ],
        );
      },
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField({Key? key}) : super(key: key);

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  @override
  void initState() {
    super.initState();
    _searchNode = FocusNode();
  }

  @override
  void dispose() {
    _searchNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return AppTextFieldWithLabel(
          focusNode: _searchNode,
          hint: "search product...",
          keyboardType: TextInputType.text,
          onChange: (v) => state.searchSales = v,
          onSubmitted: (v) => state.searchSales = v,
        );
      },
    );
  }
}

class _StackedChart extends StatelessWidget {
  const _StackedChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RetailerProfileState>(
      builder: (_, state, __) {
        return Container(
          height: AppSize.heightScreen(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              title: ChartTitle(text: 'Product Sales'),
              legend: Legend(
                  position: LegendPosition.bottom,
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap),
              primaryXAxis: CategoryAxis(
                labelRotation: -45,
                maximumLabels: 2,
                isVisible: true,
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  labelFormat: 'RM{value}',
                  maximum: 2000,
                  majorTickLines: const MajorTickLines(size: 0)),
              series: <StackedColumnSeries<Jualan, String>>[
                StackedColumnSeries<Jualan, String>(
                    dataSource: state.jualan!,
                    xValueMapper: (Jualan sales, _) => sales.name as String,
                    yValueMapper: (Jualan sales, _) => double.parse(sales.onl!),
                    name: 'Online'),
                StackedColumnSeries<Jualan, String>(
                    dataSource: state.jualan!,
                    xValueMapper: (Jualan sales, _) => sales.name as String,
                    yValueMapper: (Jualan sales, _) => double.parse(sales.pos!),
                    name: 'POS'),
                StackedColumnSeries<Jualan, String>(
                    dataSource: state.jualan!,
                    xValueMapper: (Jualan sales, _) => sales.name as String,
                    yValueMapper: (Jualan sales, _) =>
                        double.parse(sales.internal!),
                    name: 'Internal'),
                StackedColumnSeries<Jualan, String>(
                    dataSource: state.jualan!,
                    xValueMapper: (Jualan sales, _) => sales.name as String,
                    yValueMapper: (Jualan sales, _) =>
                        double.parse(sales.reject!),
                    name: 'Reject'),
                StackedColumnSeries<Jualan, String>(
                    dataSource: state.jualan!,
                    xValueMapper: (Jualan sales, _) => sales.name as String,
                    yValueMapper: (Jualan sales, _) =>
                        double.parse(sales.activation!),
                    name: 'Activation'),
                StackedColumnSeries<Jualan, String>(
                    dataSource: state.jualan!,
                    xValueMapper: (Jualan sales, _) => sales.name as String,
                    yValueMapper: (Jualan sales, _) =>
                        double.parse(sales.offl!),
                    name: 'Offline'),
              ],
              tooltipBehavior: TooltipBehavior(
                  enable: true, header: '', canShowMarker: true),
            ),
          ),
        );
      },
    );
  }
}
