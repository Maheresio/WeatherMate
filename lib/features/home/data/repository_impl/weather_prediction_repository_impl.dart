import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_mate/core/error/failure.dart';
import 'package:weather_mate/core/error/server_failure.dart';
import 'package:weather_mate/features/home/data/data_source/weather_prediction_data_source.dart';
import 'package:weather_mate/features/home/domain/repository/weather_prediction_repository.dart';

class WeatherPredictionRepositoryImpl implements WeatherPredictionRepository {
  final WeatherPredictionDataSource weatherPredictionDataSource;

  WeatherPredictionRepositoryImpl(this.weatherPredictionDataSource);
  @override
  Future<Either<Failure, int>> getWeatherPrediction(List<int> features) async {
    try {
      final prediction =
          await weatherPredictionDataSource.getWeatherPrediction(features);
      return Right(prediction);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
