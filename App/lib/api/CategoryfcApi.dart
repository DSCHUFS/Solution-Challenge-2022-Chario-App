import 'dart:convert';
import 'package:http/http.dart' as http;

Future<CateFdata> fetchCateFeJdata(String cate_id) async
{
  final response = await http.get(
      Uri.parse("http://34.134.67.181:8080/api/category/"+ cate_id + "/facilities"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  print('CategoryFcApi ${response.statusCode}');

  if (response.statusCode == 200)
  {
    String jsonData = response.body;
    return CateFdata.fromJson(jsonDecode(jsonData));
  } else {
    throw Exception('Failed to load data');
  }
}


class CateFdata {
  final int count;
  final List<Facility> data;

  const CateFdata({
    required this.count,
    required this.data,
  });

  factory CateFdata.fromJson(Map<String, dynamic> json)
  {

      return CateFdata(count: json["count"], data: List<Facility>.from(json["data"].map((x) => Facility.fromJson(x))));

  }

}
class Facility {
  Facility({
    required this.facility,
  });

  CateFacility facility;

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(facility: CateFacility.fromJson(json["facility"])
  );}


}


class CateFacility {
  CateFacility({
    required this.fId,
    required this.fName,
    required this.fIntro,
    required this.fMinimal,
    required this.fHome,
    required this.fArs,
    required this.fPhone,
    required this.fPay,
    required this.fLogo,
  });

  int fId;
  String fName;
  String fIntro;
  int fMinimal;
  String fHome;
  String fArs;
  String fPhone;
  String fPay;
  String fLogo;

  factory CateFacility.fromJson(Map<String, dynamic> json)
  {
    return CateFacility(
        fId: json["f_id"],
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