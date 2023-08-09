import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

late FocusNode _searchNode;

class SalesPage extends StatelessWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminProfileState(),
      child: Consumer<AdminProfileState>(
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

    final state = context.read<AdminProfileState>();

    state.getSales('');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProfileState>(
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
                : state.sales == null
                    ? Center(
                        child: TextManrope(
                          text: 'Sorry, no search result',
                        ),
                      )
                    : Container(
                        width: AppSize.widthScreen(context),
                        child: _StackedChart(),
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
    return Consumer<AdminProfileState>(
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
    return Consumer<AdminProfileState>(
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
              series: <StackedColumnSeries<Sales, String>>[
                StackedColumnSeries<Sales, String>(
                    dataSource: state.sales!,
                    xValueMapper: (Sales sales, _) => sales.name as String,
                    yValueMapper: (Sales sales, _) => double.parse(sales.onl!),
                    name: 'Online'),
                StackedColumnSeries<Sales, String>(
                    dataSource: state.sales!,
                    xValueMapper: (Sales sales, _) => sales.name as String,
                    yValueMapper: (Sales sales, _) => double.parse(sales.pos!),
                    name: 'POS'),
                StackedColumnSeries<Sales, String>(
                    dataSource: state.sales!,
                    xValueMapper: (Sales sales, _) => sales.name as String,
                    yValueMapper: (Sales sales, _) =>
                        double.parse(sales.internal!),
                    name: 'Internal'),
                StackedColumnSeries<Sales, String>(
                    dataSource: state.sales!,
                    xValueMapper: (Sales sales, _) => sales.name as String,
                    yValueMapper: (Sales sales, _) =>
                        double.parse(sales.reject!),
                    name: 'Reject'),
                StackedColumnSeries<Sales, String>(
                    dataSource: state.sales!,
                    xValueMapper: (Sales sales, _) => sales.name as String,
                    yValueMapper: (Sales sales, _) =>
                        double.parse(sales.activation!),
                    name: 'Activation'),
                StackedColumnSeries<Sales, String>(
                    dataSource: state.sales!,
                    xValueMapper: (Sales sales, _) => sales.name as String,
                    yValueMapper: (Sales sales, _) => double.parse(sales.offl!),
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
