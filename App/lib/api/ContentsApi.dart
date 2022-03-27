import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future <ContentsApi>fetchContJdata(String fcId)async {

  final response = await http.get
    (
      Uri.parse("http://34.134.67.181:8080/api/facility/"+fcId),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  if (response.statusCode == 200)
  {
    String jsonData = response.body;
    return ContentsApi.fromJson(jsonDecode(jsonData));
  } else {
    throw Exception('Failed to load data');
  }
}

class ContentsApi {
  ContentsApi({
    required this.facDto,
    required this.contentsList,
  });

  FacDto facDto;
  final List<ContentsList> contentsList;

  factory ContentsApi.fromJson(Map<String, dynamic> json)
  {
    return ContentsApi(
      facDto: FacDto.fromJson(json["facDto"]),
    contentsList:List<ContentsList>.from(json["contentsList"].map((x) => ContentsList.fromJson(x))));}
  


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

  factory FacDto.fromJson(Map<String, dynamic> json){
    return FacDto(
      fName: json["f_name"],
      fIntro: json["f_intro"],
      fMinimal: json["f_minimal"],
      fHome: json["f_home"],
      fArs: json["f_ars"],
      fPhone: json["f_phone"],
      fPay: json["f_pay"],
      fLogo: json["f_logo"],
    );
  }


}



class ContentsList {
  ContentsList({
    required this.fId,
    required this.cId,
    required this.title,
    required this.body,
    required this.image,
    required this.url,
    required this.pubDate,
  });

  int fId;
  int cId;
  String title;
  String body;
  String image;
  String url;
  DateTime pubDate;

  factory ContentsList.fromJson(Map<String, dynamic> json){
    return ContentsList(
      fId: json["f_id"],
      cId: json["c_id"],
      title: json["title"],
      body: json["body"],
      image: json["image"],
      url: json["url"],
      pubDate: DateTime.parse(json["pub_date"]),
    );

  }



}


