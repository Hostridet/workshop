import 'models/accel_sample.dart';
import 'utils/test_utils.dart';

/// Метод определения количества шагов
///
/// Шаги рассчитываются на основе данных акселерометра [samples]
int detect(List<AccelSample> samples) {
  return samples.length;
}

void main() {
  runTests(detect);
}
