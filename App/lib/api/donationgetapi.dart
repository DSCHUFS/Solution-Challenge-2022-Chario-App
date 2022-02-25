import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future <UserDonJdata>fetchDonJdata(var g_name)async {

  final response = await http.get
    (
      Uri.parse("https://1e85ce8f-6ffc-402d-9365-0576000728de.mock.pstmn.io/api/donation/"+"1"),
        headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    }


      // Uri.parse("http://34.134.67.181:8080/api/subscribes"),
      // headers: {
      //   "Accept": "application/json",
      //   "Access-Control-Allow-Origin": "*"
      // }
  );


  print(response.statusCode);

  if (response.statusCode == 200)
  {
    String jsonData = response.body;

    var myJson = jsonDecode(jsonData);
    print(myJson);
    print(myJson['data']);

    //return myJson;

    return UserDonJdata.fromJson(myJson);
  } else {
    throw Exception('Failed to load data');
  }

}


class UserDonJdata
{

  final List<Data> datag;
  final int fac_count;
  final int total_price;


  UserDonJdata({
    required this.datag,
    required this.fac_count,
    required this.total_price

  });

  factory UserDonJdata.fromJson(Map<String, dynamic> json)
  {
    var list = json['data'] as List;
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();
    return UserDonJdata(datag: dataList, fac_count:json['fac_count'] ,total_price :json['total_price']   );
  }


}



class Data {

  final String f_name;
  final String f_logo;
  final int u_m_price;
  final String don_date;

  Data({
    required this.f_name,
    required this.f_logo,
    required this.u_m_price,
    required this.don_date
  });

  factory Data.fromJson(Map<String, dynamic> json)
  {
    return Data(
        f_name: json['f_name'],
        f_logo: json['f_logo'],
      u_m_price: json['u_m_price'] ,
      don_date: json['don_date'],
    );
  }
}

