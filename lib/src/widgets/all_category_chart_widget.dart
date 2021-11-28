import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/category/category_state.dart';
import 'package:tickley/src/bloc/category_point/category_point_cubit.dart';
import 'package:tickley/src/bloc/category_point/category_point_state.dart'
    as cs;
import 'package:tickley/src/utils/color_extension.dart';
import 'package:tickley/src/utils/widget_functions.dart';

class AllCategoryChartWidget extends StatefulWidget {
  AllCategoryChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  AllCategoryChartWidgetState createState() => AllCategoryChartWidgetState();
}

class AllCategoryChartWidgetState extends State<AllCategoryChartWidget> {
  int touchedIndex = -1;
  final colorList = [
    0xff0293ee,
    0xfff8b250,
    0xff845bef,
    0xff13d38e,
    0xff472a3e
  ];
  final textColorList = [0xff044d7c, 0xff90672d, 0xff4c3788, 0xff0c7f55];
  // final percentageList=[]
  final radiusList = [75.0, 65.0, 60.0, 70.0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoryCubit>(context).fetchCategories();
    BlocProvider.of<CategoryPointCubit>(context).fetchCategoryPoints();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.1,
        child: Card(
          color: Colors.white,
          child: Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 10,
                    child: AspectRatio(
                        aspectRatio: 1.1,
                        child: BlocBuilder<CategoryPointCubit,
                            cs.CategoryPointState>(builder: (context, state) {
                          if (state is cs.Empty)
                            return CustomCircularProgressIndicator();
                          else if (state is cs.Loading)
                            return CustomCircularProgressIndicator();
                          else if (state is cs.Error)
                            return CustomCircularProgressIndicator();
                          else if (state is cs.Loaded) {
                            return PieChart(
                              PieChartData(
                                  pieTouchData: PieTouchData(touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = pieTouchResponse
                                          .touchedSection!.touchedSectionIndex;
                                    });
                                  }),
                                  startDegreeOffset: 180,
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 1,
                                  centerSpaceRadius: 30,
                                  sections: showingSections(state.points)),
                            );
                          }
                          return Container();
                        })),
                  ),
                  BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (_, state) {
                    if (state is Empty)
                      return CustomCircularProgressIndicator();
                    else if (state is Loading)
                      return CustomCircularProgressIndicator();
                    else if (state is Error) {
                      return CustomCircularProgressIndicator();
                    } else if (state is Loaded) {
                      return Expanded(
                          flex: 4,
                          child: Container(
                              height: 200,
                              width: 100,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return index == state.categories.length - 1
                                        ? Container()
                                        : Indicator(
                                            color: Color(colorList[index]),
                                            text: state.categories[index].label,
                                            isSquare: false,
                                            size:
                                                touchedIndex == index ? 15 : 13,
                                            textColor: touchedIndex == index
                                                ? Colors.black
                                                : Colors.grey,
                                          );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container();
                                  },
                                  itemCount: state.categories.length)));
                    }
                    return Container();
                  }),
                  SizedBox(width: 10)
                ]),
          ]),
        ));
  }

  List<PieChartSectionData> showingSections(List<double> points) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final opacity = isTouched ? 1.0 : 0.6;
      double sum = points.reduce((a, b) => a + b);

      return PieChartSectionData(
        color: Color(colorList[i]).withOpacity(opacity),
        value: points[i],
        title: ((points[i] / sum) * 100).round().toString() + '%',
        radius: radiusList[i],
        titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(textColorList[i])),
        titlePositionPercentageOffset: 0.55,
        borderSide: isTouched
            ? BorderSide(color: Color(colorList[i]).darken(40), width: 6)
            : BorderSide(color: Color(colorList[i]).withOpacity(0)),
      );
    });
  }
}
