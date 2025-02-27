import 'package:dartz/dartz.dart';
import 'package:weather_mate/core/error/failure.dart';

abstract class WeatherPredictionRepository {
  Future<Either<Failure, int>> getWeatherPrediction(List<int> features);
}
