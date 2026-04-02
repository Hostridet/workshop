import 'dart:convert';
import 'dart:io';
import 'dart:math';
import '../models/accel_sample.dart';

/// Проверить результат
void runTests(
  int Function(List<AccelSample> samples) detect,
) {
  _runTest(
    'Движение устройства параллельно полу (50 шагов)',
    detect,
    filePath: 'bin/utils/assets/flat_50.txt',
    expectedSteps: 50,
  );

  _runTest(
    'Движение устройства параллельно полу (100 шагов)',
    detect,
    filePath: 'bin/utils/assets/flat_100.txt',
    expectedSteps: 100,
  );

  _runTest(
    'Движение с устройством в кармане (50 шагов)',
    detect,
    filePath: 'bin/utils/assets/pocket_50.txt',
    expectedSteps: 50,
  );

  _runTest(
    'Движение с устройством в кармане (100 шагов)',
    detect,
    filePath: 'bin/utils/assets/pocket_100.txt',
    expectedSteps: 100,
  );

  _runTest(
    'Ходьба с минимальным движением устройства (50 шагов)',
    detect,
    filePath: 'bin/utils/assets/hard_50.txt',
    expectedSteps: 50,
  );

  _runTest(
    'Ходьба с минимальным движением устройства (100 шагов)',
    detect,
    filePath: 'bin/utils/assets/hard_100.txt',
    expectedSteps: 100,
  );

  _runTest(
    'Ходьба с интенсивным движением руки (50 шагов)',
    detect,
    filePath: 'bin/utils/assets/intensive_50.txt',
    expectedSteps: 50,
  );

  _runTest(
    'Ходьба с интенсивным движением руки (100 шагов)',
    detect,
    filePath: 'bin/utils/assets/intensive_100.txt',
    expectedSteps: 100,
  );

  _runTest(
    'Движение по лестнице с устройством в руке (50 шагов)',
    detect,
    filePath: 'bin/utils/assets/stairs_50.txt',
    expectedSteps: 50,
  );

  _runTest(
    'Вращение устройства',
    detect,
    filePath: 'bin/utils/assets/rotation.txt',
    expectedSteps: 0,
  );

  _runTest(
    'Покачивание устройства в руке',
    detect,
    filePath: 'bin/utils/assets/swaying.txt',
    expectedSteps: 0,
  );

  _runTest(
    'Движение вверх-вниз без перемещения',
    detect,
    filePath: 'bin/utils/assets/up_down.txt',
    expectedSteps: 0,
  );
}

/// Проверить результат по конкретному набору данных
void _runTest(
  String name,
  int Function(List<AccelSample> samples) detect, {
  required String filePath,
  required int expectedSteps,
}) {
  final samples = _loadFile(filePath);
  final predicted = detect(samples);
  final acc = _accuracy(predicted, expectedSteps);

  print('--- $name ---');
  print('Фактическое количество шагов: $expectedSteps');
  print('Предполагаемое количество шагов: $predicted');
  print('Точность: ${acc.toStringAsFixed(2)}%');
  print('');
}

/// Загрузка файла с тестовыми данными
List<AccelSample> _loadFile(String path) {
  final lines = File(path).readAsLinesSync();

  return lines.map((line) {
    final json = jsonDecode(line);

    return AccelSample(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
      timeStamp: json['t'] as int,
    );
  }).toList();
}

/// Подсчет точности вычислений
double _accuracy(int predicted, int actual) {
  if (actual == 0) {
    return predicted == 0 ? 100.0 : 0.0;
  }
  return max(
    0,
    (1 - (predicted - actual).abs() / actual) * 100,
  );
}
