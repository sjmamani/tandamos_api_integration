// To parse this JSON data, do
//
//     final configurationTanda = configurationTandaFromJson(jsonString);

import 'dart:convert';

ConfigurationTanda configurationTandaFromJson(String str) =>
    ConfigurationTanda.fromJson(json.decode(str));

String configurationTandaToJson(ConfigurationTanda data) =>
    json.encode(data.toJson());

class ConfigurationTanda {
  ConfigurationTanda({
    required this.order,
    required this.frequency,
  });

  int order;
  List<Frequency> frequency;

  factory ConfigurationTanda.fromJson(Map<String, dynamic> json) =>
      ConfigurationTanda(
        order: json["order"],
        frequency: List<Frequency>.from(
            json["frequency"].map((x) => Frequency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order": order,
        "frequency": List<dynamic>.from(frequency.map((x) => x.toJson())),
      };
}

class Frequency {
  Frequency({
    required this.configurationTandaId,
    required this.name,
    required this.segment,
    required this.frequencyDurationLabelSingular,
    required this.frequencyDurationLabelPlural,
    required this.durationMin,
    required this.durationMax,
    required this.duration,
  });

  int configurationTandaId;
  String name;
  String segment;
  String frequencyDurationLabelSingular;
  String frequencyDurationLabelPlural;
  int durationMin;
  int durationMax;
  List<Duration> duration;

  factory Frequency.fromJson(Map<String, dynamic> json) => Frequency(
        configurationTandaId: json["configuration_tanda_id"],
        name: json["name"],
        segment: json["segment"],
        frequencyDurationLabelSingular:
            json["frequency_duration_label_singular"],
        frequencyDurationLabelPlural: json["frequency_duration_label_plural"],
        durationMin: json["duration_min"],
        durationMax: json["duration_max"],
        duration: List<Duration>.from(
            json["duration"].map((x) => Duration.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "configuration_tanda_id": configurationTandaId,
        "name": name,
        "segment": segment,
        "frequency_duration_label_singular": frequencyDurationLabelSingular,
        "frequency_duration_label_plural": frequencyDurationLabelPlural,
        "duration_min": durationMin,
        "duration_max": durationMax,
        "duration": List<dynamic>.from(duration.map((x) => x.toJson())),
      };
}

class Duration {
  Duration({
    required this.duration,
    required this.minNumberAvailable,
    required this.amountMin,
    required this.amountMax,
    required this.tandaNumber,
  });

  int duration;
  int minNumberAvailable;
  int amountMin;
  int amountMax;
  List<TandaNumber> tandaNumber;

  factory Duration.fromJson(Map<String, dynamic> json) => Duration(
        duration: json["duration"],
        minNumberAvailable: json["min_number_available"],
        amountMin: json["amount_min"],
        amountMax: json["amount_max"],
        tandaNumber: List<TandaNumber>.from(
            json["tanda_number"].map((x) => TandaNumber.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "min_number_available": minNumberAvailable,
        "amount_min": amountMin,
        "amount_max": amountMax,
        "tanda_number": List<dynamic>.from(tandaNumber.map((x) => x.toJson())),
      };
}

class TandaNumber {
  TandaNumber({
    required this.number,
    required this.fee,
  });

  int number;
  double fee;

  factory TandaNumber.fromJson(Map<String, dynamic> json) => TandaNumber(
        number: json["number"],
        fee: json["fee"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "fee": fee,
      };
}
