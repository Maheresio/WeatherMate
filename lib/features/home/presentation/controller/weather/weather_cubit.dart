import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_mate/features/home/domain/entity/weather_entity.dart';
import 'package:weather_mate/features/home/domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.getWeatherUsecase) : super(WeatherInitial());

  final GetWeatherUsecase getWeatherUsecase;

  void getWeather(String city) async {
    emit(WeatherLoading());
    final result = await getWeatherUsecase.execute(city);
    result.fold(
      (failure) => emit(WeatherFailed(message: failure.message)),
      (weather) => emit(WeatherSuccess(weather: weather)),
    );
  }
}
