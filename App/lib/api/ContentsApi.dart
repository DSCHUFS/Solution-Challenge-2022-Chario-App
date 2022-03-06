import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
<<<<<<< HEAD

Future <ContentsApi>fetchContJdata(var fcId)async {
=======

Future <ContentsApi>fetchContJdata(var fcId)async {


>>>>>>> origin

  final response = await http.get
    (
      Uri.parse("https://1e85ce8f-6ffc-402d-9365-0576000728de.mock.pstmn.io/api/facility/"+fcId),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );

  if (response.statusCode == 200)
  {

    String jsonData = response.body;

    print(jsonDecode(jsonData));

    return ContentsApi.fromJson(jsonDecode(jsonData));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}


ContentsApi ContentsApiFromJson(String str) => ContentsApi.fromJson(json.decode(str));

String ContentsApiToJson(ContentsApi data) => json.encode(data.toJson());

class ContentsApi {
  ContentsApi({
    required this.facDto,
    required this.contentsList,
  });

  FacDto facDto;
  List<ContentsList> contentsList;

  factory ContentsApi.fromJson(Map<String, dynamic> json) => ContentsApi(
    facDto: FacDto.fromJson(json["facDto"]),
    contentsList: List<ContentsList>.from(json["contentsList"].map((x) => ContentsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "facDto": facDto.toJson(),
    "contentsList": List<dynamic>.from(contentsList.map((x) => x.toJson())),
  };
}




class ContentsList {
  ContentsList({
    required this.cTitle,
    required this.cContents,
    required this.cImage,
    required this.cUrl,
    required this.cPubDate,
  });

  String cTitle;
  String cContents;
  String cImage;
  String cUrl;
  DateTime cPubDate;

  factory ContentsList.fromJson(Map<String, dynamic> json) => ContentsList(
    cTitle: json["c_title"],
    cContents: json["c_contents"],
    cImage: json["c_image"],
    cUrl: json["c_url"],
    cPubDate: DateTime.parse(json["c_pub_date"]),
  );

  Map<String, dynamic> toJson() => {
    "c_title": cTitle,
    "c_contents": cContents,
    "c_image": cImage,
    "c_url": cUrl,
    "c_pub_date": cPubDate.toIso8601String(),
  };
}

class FacDto {
  FacDto({
    required this.fName,
    required this.fIntro,
    required this.fMinimal,
    required this.fHome,
    required this.fArs,
    required this.fPhone,
    required this.fPay,
    required this.fLogo,
  });

  String fName;
  String fIntro;
  int fMinimal;
  String fHome;
  String fArs;
  String fPhone;
  String fPay;
  String fLogo;

  factory FacDto.fromJson(Map<String, dynamic> json) =>
      FacDto(
        fName: json["f_name"],
        fIntro: json["f_intro"],
        fMinimal: json["f_minimal"],
        fHome: json["f_home"],
        fArs: json["f_ars"],
        fPhone: json["f_phone"],
        fPay: json["f_pay"],
        fLogo: json["f_logo"],
      );

  Map<String, dynamic> toJson() =>
      {
        "f_name": fName,
        "f_intro": fIntro,
        "f_minimal": fMinimal,
        "f_home": fHome,
        "f_ars": fArs,
        "f_phone": fPhone,
        "f_pay": fPay,
        "f_logo": fLogo,
      };
}