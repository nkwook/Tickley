import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/category/category_state.dart';
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
  int selectedDataSetIndex = -1;

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
                selectedDataSetIndex = -1;
              });
            },
            child: Text(
              '저감량 분포',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 14),
          AspectRatio(
              aspectRatio: 1.3,
              child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (_, state) {
                if (state is Empty)
                  return CustomCircularProgressIndicator();
                else if (state is Loading)
                  return CustomCircularProgressIndicator();
                else if (state is Error)
                  return CustomCircularProgressIndicator();
                else if (state is Loaded) {
                  return
                      // Container();
                      widget.point.reduce((a, b) => a + b) == 0
                          ? Container(
                              alignment: Alignment.center,
                              child: Text('미션을 수행하고 통계를 확인하세요!'),
                            )
                          : RadarChart(
                              RadarChartData(
                                radarTouchData: RadarTouchData(touchCallback:
                                    (FlTouchEvent event, response) {
                                  if (!event.isInterestedForInteractions) {
                                    setState(() {
                                      selectedDataSetIndex = -1;
                                    });
                                    return;
                                  }
                                  setState(() {
                                    selectedDataSetIndex = response?.touchedSpot
                                            ?.touchedDataSetIndex ??
                                        -1;
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
                            );
                }
                return Container();
              })),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rawDataSets()
                .asMap()
                .map((index, value) {
                  final isSelected = index == selectedDataSetIndex;
                  return MapEntry(
                    index,
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDataSetIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        height: 26,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? gridColor.withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(46),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInToLinear,
                              padding: EdgeInsets.all(isSelected ? 8 : 6),
                              decoration: BoxDecoration(
                                color: value.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInToLinear,
                              style: TextStyle(
                                color: isSelected ? value.color : gridColor,
                              ),
                              child: Text(value.title),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
                .values
                .toList(),
          ),
        ],
      ),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      var index = entry.key;
      var rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
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
        values:
            //  [0.0, 0.0, 0.0, 0.0]
            widget.point,
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
