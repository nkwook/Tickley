import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/category/category_state.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/widget_functions.dart';

const gridColor = Color(0xff68739f);
const titleColor = Color(0xff8c95db);
const graphColor = Color(0xff90CA8B);
const artColor = Color(0xff63e7e5);
const boxingColor = Color(0xff83dea7);
const entertainmentColor = Colors.white70;
const offRoadColor = Color(0xFFFFF59D);

class MyCategoryChartWidget extends StatefulWidget {
  final List<double> point;

  const MyCategoryChartWidget({Key? key, required this.point})
      : super(key: key);

  @override
  _MyCategoryChartWidgetState createState() => _MyCategoryChartWidgetState();
}

class _MyCategoryChartWidgetState extends State<MyCategoryChartWidget> {
  double selectedPoint = -1;
  String selectedCategory = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoryCubit>(context).fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  selectedPoint = -1;
                  selectedCategory = '';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('포인트 분석', style: FontBoldGreen20),
                  selectedPoint != -1
                      ? Text(
                          selectedCategory +
                              ': ' +
                              selectedPoint.toStringAsFixed(0) +
                              '  ',
                          style: TextStyle(
                            color: Color(0xFF727272),
                          ))
                      : Text("")
                ],
              )),
          const SizedBox(height: 10),
          AspectRatio(
              aspectRatio: 1.1,
              child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (_, state) {
                if (state is Empty)
                  return CustomCircularProgressIndicator();
                else if (state is Loading)
                  return CustomCircularProgressIndicator();
                else if (state is Error)
                  return CustomCircularProgressIndicator();
                else if (state is Loaded) {
                  return Container(
                      width: 320,
                      padding: EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: COLOR_BORDER, width: 1)),
                      child: widget.point.reduce((a, b) => a + b) == 0
                          ? Container(
                              alignment: Alignment.center,
                              child: Text('미션을 수행하고 통계를 확인하세요!'),
                            )
                          : RadarChart(
                              RadarChartData(
                                radarTouchData: RadarTouchData(
                                    enabled: true,
                                    touchCallback:
                                        (FlTouchEvent event, response) {
                                      // print(response?.touchedDataSetIndex);

                                      if (!event.isInterestedForInteractions) {
                                        setState(() {
                                          selectedPoint = -1;
                                          selectedCategory = '';
                                        });
                                        return;
                                      }
                                      int selected = response?.touchedSpot
                                              ?.touchedRadarEntryIndex ??
                                          -1;
                                      setState(() {
                                        selectedPoint = selected != -1
                                            ? widget.point[selected]
                                            : -1;

                                        selectedCategory = selected != -1
                                            ? state.categories[selected].label
                                            : '';
                                      });
                                    }),
                                dataSets: showingDataSets(),
                                radarBackgroundColor: Colors.transparent,
                                borderData: FlBorderData(show: false),
                                radarBorderData:
                                    const BorderSide(color: Colors.transparent),
                                titlePositionPercentageOffset: 0.2,
                                titleTextStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 14),
                                getTitle: (index) {
                                  return state.categories[index].label;
                                },
                                tickCount: 1,
                                ticksTextStyle: const TextStyle(
                                    color: Colors.transparent, fontSize: 10),
                                tickBorderData:
                                    const BorderSide(color: Colors.transparent),
                                gridBorderData: const BorderSide(
                                    color: gridColor, width: 2),
                              ),
                              swapAnimationDuration:
                                  const Duration(milliseconds: 400),
                            ));
                }
                return Container();
              })),
        ],
      ),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      var index = entry.key;
      var rawDataSet = entry.value;

      final isSelected = index == selectedPoint
          ? true
          : selectedPoint == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'User',
        color: graphColor,
        values: widget.point,
      ),
    ];
  }
}

class RawDataSet {
  final String title;
  final Color color;
  final List<double> values;

  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });
}
