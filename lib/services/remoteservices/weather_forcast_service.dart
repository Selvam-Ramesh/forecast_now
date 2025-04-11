import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:forecast_now/model/forecastmodel.dart';
import 'package:forecast_now/utility/api_urls.dart';

class WeatherForcastService {

  Future<Map<String,dynamic>> getCurrentTemp({String? City, Position? position}) async {
    if (position!=null)
      {
        try {
          var response = await http.get(Uri.parse(api_urls.getforcast+position.latitude.toString()+','+position.longitude.toString()+'&days=1'));
          if (response.statusCode == 200)
            {
              var decodedjson = jsonDecode(response.body);

              print( Current.fromJson(decodedjson['current']).tempC);
              print( Current.fromJson(decodedjson['current']).isDay);
              print( Current.fromJson(decodedjson['current']).condition?.text);

              return {
                "tempC":Current.fromJson(decodedjson['current']).tempC,
                "isDay":Current.fromJson(decodedjson['current']).isDay,
                "country":Location.fromJson(decodedjson['location']).country,
                "city":Location.fromJson(decodedjson['location']).name,
                "conditionText":Current.fromJson(decodedjson['current']).condition?.text,
              };
            }
          else if (response.statusCode == 400)
            {
              return{
                "error":"Not Getting Forecast!"
              };
            }
        } catch (e) {
          print(e);
        }
      }
    if (City!=null)
      {
        try {
          var response = await http.get(Uri.parse(api_urls.getforcast+City+'&days=1'));
          if (response.statusCode == 200)
            {
              var decodedjson = jsonDecode(response.body);

              print( Current.fromJson(decodedjson['current']).tempC);
              print( Current.fromJson(decodedjson['current']).isDay);
              print( Current.fromJson(decodedjson['current']).condition?.text);

              return {
                "tempC":Current.fromJson(decodedjson['current']).tempC,
                "isDay":Current.fromJson(decodedjson['current']).isDay,
                "country":Location.fromJson(decodedjson['location']).country,
                "city":Location.fromJson(decodedjson['location']).name,
                "conditionText":Current.fromJson(decodedjson['current']).condition?.text,
              };
            }
          else if (response.statusCode == 400)
            {
              return{
                "error":"Not Getting Forecast!"
              };
            }
        } catch (e) {
          print(e);
        }
      }
    return {
      "error":"Not Getting Forecast!"
    };
  }

  Future<Map<String,dynamic>> getForecast({String? City, Position? position}) async {
    if (position!=null){

        var response = await http.get(Uri.parse(
            api_urls.getforcast + position.latitude.toString() + ',' + position.longitude.toString() + '&days=1'));
        if (response.statusCode == 200) {
          var decodedjson = jsonDecode(response.body);

          return{
            "1":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![0],
            "2":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![1],
            "3":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![2],
            "4":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![3],
            "5":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![5],
          };
        }
    }
    else if (City!=null){
        var response = await http.get(Uri.parse(
            api_urls.getforcast +City+ '&days=1'));
        if (response.statusCode == 200) {
          var decodedjson = jsonDecode(response.body);

          return{
            "1":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![0],
            "2":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![1],
            "3":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![2],
            "4":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![3],
            "5":Forecast.fromJson(decodedjson['forecast']).forecastday![0].hour![5],
          };
        }
    }
    return{
      "error":"Not Getting Forecast!"
    };
  }
  
}