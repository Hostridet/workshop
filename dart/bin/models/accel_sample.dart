/// Измерение акселерометра
class AccelSample {
  /// Ось вдоль длинной стороны устройства
  final double x;

  /// Ось вдоль короткой стороны
  final double y;

  /// Ось перпендикулярно плоскости экрана
  final double z;

  /// Время измерения данных
  final int timeStamp;

  const AccelSample({
    required this.x,
    required this.y,
    required this.z,
    required this.timeStamp,
  });
}
