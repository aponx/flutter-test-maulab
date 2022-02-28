import 'dart:convert';

import 'package:ajobthing/model/home.dart';
import 'package:ajobthing/model/home_repository.dart';
import 'package:ajobthing/model/home_response.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  HomeResponse _homeResponse = HomeResponse.initial('Empty data');

  List<Home>? _homeList;
  Home? _home;

  HomeResponse get response {
    return _homeResponse;
  }

  Home? get home {
    return _home;
  }

  Future<void> fetchHomeData() async {
    _homeResponse = HomeResponse.loading('Fetching home data');
    notifyListeners();
    try {
      List<Home> homelist = await HomeRepository().fetchHomeList();
      _homeList = homelist;
      homelist.shuffle();
      _homeResponse = HomeResponse.completed(homelist);
    } catch (e) {
      _homeList = [];
      _homeResponse = HomeResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> fetchHomeDataSearch(String? search) async {
    _homeResponse = HomeResponse.loading('Fetching home data');
    notifyListeners();
    try {
        String keyword = search!;
        List<Home> homelist = [];
        for(Home a in _homeList!){
          String name = a.name!;
          if(name.contains(RegExp(r'('+keyword+')', caseSensitive: false))){
            homelist.add(a);
          }
        }
        homelist.shuffle();
        _homeResponse = HomeResponse.completed(homelist);
    } catch (e) {
      _homeResponse = HomeResponse.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> fetchHomeDataNotSearch() async {
    _homeResponse = HomeResponse.loading('Fetching home data');
    notifyListeners();
    try {
      List<Home> homelist = _homeList!;
      homelist.shuffle();
      _homeResponse = HomeResponse.completed(homelist);
    } catch (e) {
      _homeResponse = HomeResponse.error(e.toString());
    }
    notifyListeners();
  }

  void setSelectedHome(Home? home) {
    _home = home;
    notifyListeners();
  }
}