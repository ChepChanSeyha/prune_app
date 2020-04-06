import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DatumLegendWithMeasures extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DatumLegendWithMeasures(this.seriesList, {this.animate});

  factory DatumLegendWithMeasures.withSampleData() {
    return new DatumLegendWithMeasures(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      behaviors: [
        new charts.DatumLegend(
          position: charts.BehaviorPosition.start,
          horizontalFirst: false,
          cellPadding: new EdgeInsets.only(bottom: 10.0),
          showMeasures: true,
          legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          measureFormatter: (num value) {
            return value == null ? '-' : '$value%';
          },
        ),
      ],
    );
  }

  static List<charts.Series<LearningHistory, String>> _createSampleData() {
    final data = [
      new LearningHistory('Math', 23),
      new LearningHistory('Japanese', 18),
      new LearningHistory('English', 9),
      new LearningHistory('Geography', 15),
      new LearningHistory('Science', 5),
      new LearningHistory('OTHER', 30),
    ];

    return [
      new charts.Series<LearningHistory, String>(
        id: 'LearningHistory',
        domainFn: (LearningHistory subjects, _) => subjects.subjects,
        measureFn: (LearningHistory percentages, _) => percentages.percentages,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LearningHistory {
  final String subjects;
  final int percentages;

  LearningHistory(this.subjects, this.percentages);
}