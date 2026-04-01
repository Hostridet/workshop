package org.example

import org.example.models.AccelSample
import org.example.utils.TestUtils

class StepDetector {
    /**
     * Метод определения шагов
     *
     * @param samples список измерений акселерометра
     * @return количество обнаруженных шагов
     */
    fun detect(samples: List<AccelSample>): Int {
        return samples.size;
    }
}

fun main() {
    val detector = StepDetector()
    TestUtils.runTests(detector::detect)
}
