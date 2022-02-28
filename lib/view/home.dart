import 'dart:convert';

import 'package:ajobthing/model/home.dart';
import 'package:ajobthing/model/home_repository.dart';
import 'package:ajobthing/model/home_response.dart';
import 'package:ajobthing/utils/colors.dart';
import 'package:ajobthing/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final TextEditingController _inputController = TextEditingController();

  Widget getHomeWidget(BuildContext context, HomeResponse homeResponse) {
    List<Home>? homeList = homeResponse.data as List<Home>?;
    switch (homeResponse.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: HomeListWidget(homeList!, (Home home) {
                Provider.of<HomeViewModel>(context, listen: false)
                    .setSelectedHome(home);
              }),
            ),
          ],
        );
      case Status.ERROR:
        return const Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  void initState() {
    getAll();
    super.initState();
  }

  void getAll() async {
    await Provider.of<HomeViewModel>(context, listen: false).fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    HomeResponse homeResponse = Provider.of<HomeViewModel>(context).response;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextField(
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
              controller: _inputController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .setSelectedHome(null);
                  Provider.of<HomeViewModel>(context, listen: false)
                      .fetchHomeDataSearch(value);
                } else {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .setSelectedHome(null);
                  Provider.of<HomeViewModel>(context, listen: false)
                      .fetchHomeDataNotSearch();
                }
              },
              onSubmitted: (value) {

              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xff28404a),
                ),
                hintText: 'Enter keyword',
                hintStyle: TextStyle(
                  color: Color(0xff28404a)
                )
              )),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: getHomeWidget(context, homeResponse)),
        ],
      ),
    );
  }
}
