part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeather implements WeatherEvent {
  final String cityName;

  const GetWeather(
    this.cityName,
  );

  @override
  List<Object> get props => [props];

  @override
  bool? get stringify => true;
}

class GetDetailedWeather implements WeatherEvent {
  final String cityName;

  const GetDetailedWeather(this.cityName);

  @override
  List<Object> get props => [cityName];

  @override
  bool? get stringify => true;
}
