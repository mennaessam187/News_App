//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/screean/business_screen.dart';
import 'package:news_app/UI/screean/generalnews_sreen.dart';
import 'package:news_app/UI/screean/sports.dart';
import 'package:news_app/data/cubit/states.dart';
import 'package:news_app/data/services/api_services.dart';
import 'package:news_app/utils/app_const.dart';
import 'package:news_app/utils/color_manager.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const GenaralNewsScreens(),
    const sportsScreen(),
  ];
  void ChangeBottomNavigationBar(index) {
    currentindex = index;
    emit(ChangeBottomNavigationBarState());
  }

  List<BottomNavigationBarItem> buttomitems = [
    const BottomNavigationBarItem(
      label: "business",
      icon: Icon(
        Icons.business,
        color: Color(colorManager.bottomnavbarcolor),
      ),
    ),
    const BottomNavigationBarItem(
      label: "genaral",
      icon: Icon(
        Icons.newspaper,
        color: Color(colorManager.bottomnavbarcolor),
      ),
    ),
    const BottomNavigationBarItem(
      label: "sports",
      icon: Icon(
        Icons.sports,
        color: Color(colorManager.bottomnavbarcolor),
      ),
    ),
  ];
  List<dynamic> business = [];
  void getBusiness() {
    emit(GetSportsDataLoading());
    apiServices.getData(url: AppConstant.topHeadline, query: {
      "apiKey": AppConstant.apiKey,
      "country": "eg",
      "category": "business",
    }).then((value) {
      //debugPrint(value.data["articles"][0]["title"]);
      business = value.data["articles"];
      emit(GetBusinessDataSuccessfully());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetBusinessDataError(error: error.toString()));
    });
  }

  List<dynamic> general = [];
  void getGeneralNews() {
    emit(GetSportsDataLoading());
    apiServices.getData(url: AppConstant.topHeadline, query: {
      "apiKey": AppConstant.apiKey,
      "country": "eg",
      "category": "general",
    }).then((value) {
      //debugPrint(value.data["articles"][0]["title"]);
      general = value.data["articles"];
      //general = value.data["articles"];
      emit(GetBusinessDataSuccessfully());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetBusinessDataError(error: error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSportsNews() {
    emit(GetSportsDataLoading());
    apiServices.getData(url: AppConstant.topHeadline, query: {
      "apiKey": AppConstant.apiKey,
      "country": "eg",
      "category": "sports",
    }).then((value) {
      //debugPrint(value.data["articles"][0]["title"]);
      sports = value.data["articles"];
      emit(GetBusinessDataSuccessfully());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetBusinessDataError(error: error.toString()));
    });
  }
}
