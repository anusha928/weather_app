

class Weather {
   String city;
  final String icon;
  final double temp;
  final String text;
  
  
  final int humidity;
  final double wind;
  final double pressure;

  
 

  Weather(
      {required this.city,
      required this.temp ,
      required this.text,
      required this.icon,
      required this.wind,
      required this.pressure,
      
      required this.humidity
     
       });

  factory Weather.fromJson(json) {
    return Weather(
        city: json['location']['name'],
        wind: json['current']['wind_mph'],
        pressure: json['current']['pressure_mb'],
        humidity: json['current']['humidity'],
        temp: json['current']['temp_c'],
        text: json['current']['condition']['text'],
        icon: json['current']['condition']['icon']
        );
  }

  
}
