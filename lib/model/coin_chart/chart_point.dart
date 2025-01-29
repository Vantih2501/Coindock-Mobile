class ChartPoint {
  final double date;
  final double value;

  ChartPoint({ required this.date, required this.value });

  factory ChartPoint.fromList(List<dynamic> list) {
    return ChartPoint(
      date: (list[0] as num).toDouble(),
      value: (list[1] as num).toDouble(),
    );
  }
}