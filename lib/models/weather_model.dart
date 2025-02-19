class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final Location? location;
  final Current? current;
  final Forecast? forecast;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      current:
          json["current"] == null ? null : Current.fromJson(json["current"]),
      forecast:
          json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
        "forecast": forecast?.toJson(),
      };
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.timeEpoch,
    required this.time,
    required this.snowCm,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
  });

  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final double? pressureMb; // Changed from int? to double?
  final double? pressureIn;
  final double? precipMm; // Changed from int? to double?
  final double? precipIn; // Changed from int? to double?
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final double? visKm; // Changed from int? to double?
  final double? visMiles; // Changed from int? to double?
  final double? uv;
  final double? gustMph;
  final double? gustKph;
  final int? timeEpoch;
  final String? time;
  final double? snowCm; // Changed from int? to double?
  final int? willItRain;
  final int? chanceOfRain;
  final int? willItSnow;
  final int? chanceOfSnow;

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: json["last_updated_epoch"],
      lastUpdated: json["last_updated"],
      tempC: json["temp_c"]?.toDouble(),
      tempF: json["temp_f"]?.toDouble(),
      isDay: json["is_day"],
      condition: json["condition"] == null
          ? null
          : Condition.fromJson(json["condition"]),
      windMph: json["wind_mph"]?.toDouble(),
      windKph: json["wind_kph"]?.toDouble(),
      windDegree: json["wind_degree"],
      windDir: json["wind_dir"],
      pressureMb: json["pressure_mb"]?.toDouble(), // Parse as double
      pressureIn: json["pressure_in"]?.toDouble(),
      precipMm: json["precip_mm"]?.toDouble(), // Parse as double
      precipIn: json["precip_in"]?.toDouble(), // Parse as double
      humidity: json["humidity"],
      cloud: json["cloud"],
      feelslikeC: json["feelslike_c"]?.toDouble(),
      feelslikeF: json["feelslike_f"]?.toDouble(),
      windchillC: json["windchill_c"]?.toDouble(),
      windchillF: json["windchill_f"]?.toDouble(),
      heatindexC: json["heatindex_c"]?.toDouble(),
      heatindexF: json["heatindex_f"]?.toDouble(),
      dewpointC: json["dewpoint_c"]?.toDouble(),
      dewpointF: json["dewpoint_f"]?.toDouble(),
      visKm: json["vis_km"]?.toDouble(), // Parse as double
      visMiles: json["vis_miles"]?.toDouble(), // Parse as double
      uv: json["uv"]?.toDouble(),
      gustMph: json["gust_mph"]?.toDouble(),
      gustKph: json["gust_kph"]?.toDouble(),
      timeEpoch: json["time_epoch"],
      time: json["time"],
      snowCm: json["snow_cm"]?.toDouble(), // Parse as double
      willItRain: json["will_it_rain"],
      chanceOfRain: json["chance_of_rain"],
      willItSnow: json["will_it_snow"],
      chanceOfSnow: json["chance_of_snow"],
    );
  }

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "time_epoch": timeEpoch,
        "time": time,
        "snow_cm": snowCm,
        "will_it_rain": willItRain,
        "chance_of_rain": chanceOfRain,
        "will_it_snow": willItSnow,
        "chance_of_snow": chanceOfSnow,
      };
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String? text;
  final String? icon;
  final int? code;

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json["text"],
      icon: json["icon"],
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class Forecast {
  Forecast({
    required this.forecastday,
  });

  final List<Forecastday> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday: json["forecastday"] == null
          ? []
          : List<Forecastday>.from(
              json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "forecastday": forecastday.map((x) => x.toJson()).toList(),
      };
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  final DateTime? date;
  final int? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Current> hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(
      date: DateTime.tryParse(json["date"] ?? ""),
      dateEpoch: json["date_epoch"],
      day: json["day"] == null ? null : Day.fromJson(json["day"]),
      astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
      hour: json["hour"] == null
          ? []
          : List<Current>.from(json["hour"]!.map((x) => Current.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day?.toJson(),
        "astro": astro?.toJson(),
        "hour": hour.map((x) => x.toJson()).toList(),
      };
}

class Astro {
  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final int? moonIllumination;
  final int? isMoonUp;
  final int? isSunUp;

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      moonrise: json["moonrise"],
      moonset: json["moonset"],
      moonPhase: json["moon_phase"],
      moonIllumination: json["moon_illumination"],
      isMoonUp: json["is_moon_up"],
      isSunUp: json["is_sun_up"],
    );
  }

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
      };
}

class Day {
  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC; // Changed from int? to double?
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm; // Changed from int? to double?
  final double? totalprecipIn; // Changed from int? to double?
  final double? totalsnowCm; // Changed from int? to double?
  final double? avgvisKm; // Changed from int? to double?
  final double? avgvisMiles; // Changed from int? to double?
  final int? avghumidity;
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final int? dailyWillItSnow;
  final int? dailyChanceOfSnow;
  final Condition? condition;
  final double? uv;

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: json["maxtemp_c"]?.toDouble(),
      maxtempF: json["maxtemp_f"]?.toDouble(),
      mintempC: json["mintemp_c"]?.toDouble(),
      mintempF: json["mintemp_f"]?.toDouble(),
      avgtempC: json["avgtemp_c"]?.toDouble(), // Parse as double
      avgtempF: json["avgtemp_f"]?.toDouble(),
      maxwindMph: json["maxwind_mph"]?.toDouble(),
      maxwindKph: json["maxwind_kph"]?.toDouble(),
      totalprecipMm: json["totalprecip_mm"]?.toDouble(), // Parse as double
      totalprecipIn: json["totalprecip_in"]?.toDouble(), // Parse as double
      totalsnowCm: json["totalsnow_cm"]?.toDouble(), // Parse as double
      avgvisKm: json["avgvis_km"]?.toDouble(), // Parse as double
      avgvisMiles: json["avgvis_miles"]?.toDouble(), // Parse as double
      avghumidity: json["avghumidity"],
      dailyWillItRain: json["daily_will_it_rain"],
      dailyChanceOfRain: json["daily_chance_of_rain"],
      dailyWillItSnow: json["daily_will_it_snow"],
      dailyChanceOfSnow: json["daily_chance_of_snow"],
      condition: json["condition"] == null
          ? null
          : Condition.fromJson(json["condition"]),
      uv: json["uv"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "totalsnow_cm": totalsnowCm,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition?.toJson(),
        "uv": uv,
      };
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["name"],
      region: json["region"],
      country: json["country"],
      lat: json["lat"],
      lon: json["lon"],
      tzId: json["tz_id"],
      localtimeEpoch: json["localtime_epoch"],
      localtime: json["localtime"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
