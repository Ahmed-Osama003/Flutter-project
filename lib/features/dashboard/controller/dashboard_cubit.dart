import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {

  PageController pageController = PageController();
  int pageIndex = 0;
  void onChangeTap(int index){
    pageIndex = index;
    pageController.jumpToPage(index);
    emit(DashboardInitial());
  }

  DashboardCubit() : super(DashboardInitial());
}
