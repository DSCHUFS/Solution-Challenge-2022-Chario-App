import 'package:flutter/material.dart';
import 'package:flutter_try/page1/auth_screen.dart';
import 'package:flutter_try/page1/dmoneyinput_screen.dart';
import 'package:flutter_try/page1/donationask_screen.dart';
import 'package:flutter_try/page1/donationfcdetail.dart';
import 'package:flutter_try/page1/donpersonal_screen.dart';
import 'package:flutter_try/page1/personal_info_change_screen.dart';
import 'package:flutter_try/page1/personal_screen.dart';
import 'package:flutter_try/page1/regisinput_screen.dart';
import 'package:flutter_try/page1/search_screen.dart';
import 'package:flutter_try/page1/subscribe_screen.dart';
import 'package:flutter_try/page1/regissub_screen.dart';
import 'detailPage/FcDetail.dart';
import 'page1/HomePage.dart';
import 'page1/welcome_screen.dart';
import 'page1/registration_screen.dart';


class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings)
  {

    final  args = settings.arguments;

    switch(settings.name)
    {
      case
      WelcomeScreen.id:
          return MaterialPageRoute(builder:(context) => WelcomeScreen());
      case
      RegistrationScreen.id:
      return MaterialPageRoute(builder:(context) => RegistrationScreen());

      case
      HomePage.id:
      return MaterialPageRoute(builder:(context) => HomePage());

      case
      NoPoverty.id:
        print("this is in side of case");
        print(args);
      return MaterialPageRoute(
          builder:(context) =>
              NoPoverty(
        fc_id: args.toString(),
      )

      );
    case
      PersonalScreen.id:
      return MaterialPageRoute(builder:(context) => PersonalScreen());
    case
    SubscribeScreen.id:
      return MaterialPageRoute(builder:(context) => SubscribeScreen());
    case
    SearchScreen.id:
      return MaterialPageRoute(builder:(context) =>  SearchScreen());
    case
    Donationask.id:
      return MaterialPageRoute(builder:(context) => Donationask());
    case
    Donationmoneyinput.id:
      return MaterialPageRoute(builder:(context) =>  Donationmoneyinput());
    case
    DonpersonalScreen.id:
      return MaterialPageRoute(builder:(context) =>  DonpersonalScreen());
    case
    DonfcdetailScreen.id:
      return MaterialPageRoute(builder:(context) => DonfcdetailScreen());
    case
    AuthPage.id:
      return MaterialPageRoute(builder:(context) => AuthPage());
    case
    Regisinput.id:
      return MaterialPageRoute(builder:(context)=>Regisinput());
    case
    Regissub.id:
      return MaterialPageRoute(builder:(context) => Regissub());
    case
    InfochangeScreen.id :
      return MaterialPageRoute(builder:(context) => InfochangeScreen());


    default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));

    }

  }

}