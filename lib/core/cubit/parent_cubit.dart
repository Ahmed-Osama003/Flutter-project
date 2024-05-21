import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  static final ParentCubit instance = ParentCubit();
  ThemeMode themeMode = ThemeMode.light;
  String lan = "ar";
  ParentCubit() : super(ParentInitial()){
    loadLanguage1();
  }
  Map<String, dynamic> local = {};
  Future<void> loadLanguage1() async {
    String s = await rootBundle.loadString('assets/lang/ar.json');
    local = json.decode(s);
    emit(ParentInitial());
  }
  Future<void> loadLanguage2() async {
    String s = await rootBundle.loadString('assets/lang/en.json');
    local = json.decode(s);
    emit(ParentInitial());
  }

  void changeMode(){
    if(themeMode == ThemeMode.dark){
      themeMode = ThemeMode.light;
    }
    else themeMode = ThemeMode.dark;
    emit(ParentInitial());
  }

  void changeLan(){
    if(lan == "ar"){
      lan = "en";
      loadLanguage2();
    }
    else{
      lan = "ar";
      loadLanguage1();
    }
  }

}
