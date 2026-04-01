package org.example.models

/**
 * Модель одного измерения акселерометра.
 *
 * @property x ускорение вдоль длинной стороны устройства
 * @property y ускорение вдоль короткой стороны устройства
 * @property z ускорение перпендикулярно экрану
 * @property timeStamp время измерения данных
 */
data class AccelSample(
  val x: Double,
  val y: Double,
  val z: Double,
  val timeStamp: Long
)