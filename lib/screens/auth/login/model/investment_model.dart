// To parse this JSON data, do
//
//     final investmentModel = investmentModelFromJson(jsonString);

import 'dart:convert';

InvestmentModel investmentModelFromJson(String str) =>
    InvestmentModel.fromJson(json.decode(str));

String investmentModelToJson(InvestmentModel data) =>
    json.encode(data.toJson());

class InvestmentModel {
  int id;
  String investmentType;
  String term;
  String rate;
  String minInvestment;
  String otherPoints;
  String issureType;
  String jurisdication;
  String security;
  String industry;
  String useOfFund;

  InvestmentModel({
    required this.id,
    required this.investmentType,
    required this.term,
    required this.rate,
    required this.minInvestment,
    required this.otherPoints,
    required this.issureType,
    required this.jurisdication,
    required this.security,
    required this.industry,
    required this.useOfFund,
  });

  factory InvestmentModel.fromJson(Map<String, dynamic> json) =>
      InvestmentModel(
        id: json["id"],
        investmentType: json["investment_type"].toString(),
        term: json["term"].toString(),
        rate: json["rate"].toString(),
        minInvestment: json["min_investment"].toString(),
        otherPoints: json["other_points"].toString(),
        issureType: json["issure_type"].toString(),
        jurisdication: json["jurisdication"].toString(),
        security: json["security"].toString(),
        industry: json["industry"].toString(),
        useOfFund: json["use_of_fund"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "investment_type": investmentType,
        "term": term,
        "rate": rate,
        "min_investment": minInvestment,
        "other_points": otherPoints,
        "issure_type": issureType,
        "jurisdication": jurisdication,
        "security": security,
        "industry": industry,
        "use_of_fund": useOfFund,
      };
}
